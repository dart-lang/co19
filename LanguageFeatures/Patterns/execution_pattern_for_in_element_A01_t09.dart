// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// A collection element of the form:
///
/// for (<keyword> <pattern> in <expression>) <element>
///
/// Where <keyword> is var or final is treated like so:
/// 1. Let I be the static type of <expression>, inferred using context type
///   schema Iterable<P> where P is the context type schema of <pattern>.
/// 2. Calculate the element type of I:
///     i. If I implements Iterable<T> for some T then E is T.
///     ii. Else if I is dynamic then E is dynamic.
///     iii. Else it is a compile-time error.
/// 3. Type check <pattern> with matched value type E.
/// 4. If there are no compile-time errors, then execution proceeds as the
///   following code, where id1 and id2 are fresh identifiers and append() is
///   an operation to add an element to the surrounding collection being built:
/// ```dart
/// I id1 = <expression>;
/// Iterator<E> id2 = id1.iterator;
/// while (id2.moveNext()) {
///   <keyword> <pattern> = id2.current;
///   append(<element>);
/// }
/// ```
/// @description Checks that if `I` implements `Iterable<T>` for some `T` then
/// `E` is `T`. Test `T` inferred from `<pattern>` to `<expression>` and from
/// `<expression>` to `<pattern>`. Test a set literal
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";
import "patterns_lib.dart";

extension Storing on Object? {
  static dynamic stored;
  void get store => stored = this;
}

main() {
  var s1 = {
    0,
    for (var (num v1) in [1, 2, 3]..store) v1,
    4
  };
  Expect.setEquals({0, 1, 2, 3, 4}, s1);
  Expect.isTrue(Storing.stored is List<num>);
  Storing.stored.add(42);
  Storing.stored.add(3.14);

  var s2 = {
    0,
    for (final (v2) in <num>[1, 2, 3])
      v2.expectStaticType<Exactly<num>>(),
    4
  };
  Expect.setEquals({0, 1, 2, 3, 4}, s2);

  var s3 = {
    0,
    for (var <num>[v3] in [[1], [2], [3]]..store) v3,
    4
  };
  Expect.setEquals({0, 1, 2, 3, 4}, s3);
  Expect.isTrue(Storing.stored is List<List<num>>);
  Storing.stored.first.add(42);
  Storing.stored.first.add(3.14);

  var s4 = {
    0,
    for (final [v4] in <List<num>>[[1], [2], [3]])
      v4.expectStaticType<Exactly<num>>(),
    4
  };
  Expect.setEquals({0, 1, 2, 3, 4}, s4);

  var s5 = {
    0,
    for (var <String, num>{"k1": v5} in [{"k1": 1}]..store) v5,
    2
  };
  Expect.setEquals({0, 1, 2}, s5);
  Expect.isTrue(Storing.stored is List<Map<String, num>>);
  Expect.isTrue(Storing.stored.first is Map<String, num>);
  Storing.stored.first["answer"] = 42;
  Storing.stored.first["pi"] = 3.14;

  var s6 = {
    0,
    for (final {"k1": v6} in <Map<String, num>>[{"k1": 1}])
      v6.expectStaticType<Exactly<num>>(),
    2
  };
  Expect.setEquals({0, 1, 2}, s6);

  var s7 = {
    0,
    for (var (num v7, n: num v8) in [(1, n: 2)]..store) v7,
    2
  };
  Expect.setEquals({0, 1, 2}, s7);
  Expect.isTrue(Storing.stored is List<(num, {num n})>);

  var s8 = {
    1,
    for (final (v9, n: v10) in <(num, {num n})>[(1, n: 2)])
      v10.expectStaticType<Exactly<num>>(),
    3
  };
  Expect.setEquals({1, 2, 3}, s8);

  var s9 = {
    for (var Square<Centimeter>(area: v11) in [Square(1)]..store) v11,
  };
  Expect.setEquals({Unit<Centimeter>(1)}, s9);
  Expect.isTrue(Storing.stored is List<Square<Centimeter>>);

  var s10 = {
    for (final Square(area: v12) in <Square<Centimeter>>[Square<Centimeter>(1)])
      v12.expectStaticType<Exactly<Unit<Centimeter>>>()
  };
  Expect.setEquals({Unit<Centimeter>(1)}, s10);
}
