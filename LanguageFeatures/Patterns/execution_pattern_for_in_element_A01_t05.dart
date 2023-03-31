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
/// `<expression>` to `<pattern>`. Test a map literal
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";
import "patterns_lib.dart";

extension Storing on Object? {
  static dynamic stored;
  void get store => stored = this;
}

main() {
  var m1 = {
    "k0": 0,
    for (var (num v1) in [1, 2, 3]..store) "k$v1": v1,
    "k4": 4
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, m1);
  Expect.isTrue(Storing.stored is List<num>);
  Storing.stored.add(42);
  Storing.stored.add(3.14);

  var m2 = {
    "k0": 0,
    for (final (v2) in <num>[1, 2, 3])
    "k$v2": v2.expectStaticType<Exactly<num>>(),
    "k4": 4
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, m2);

  var m3 = {
    "k0": 0,
    for (var <num>[v3] in [[1], [2], [3]]..store) "k$v3": v3,
    "k4": 4
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, m3);
  Expect.isTrue(Storing.stored is List<List<num>>);
  Storing.stored.first.add(42);
  Storing.stored.first.add(3.14);

  var m4 = {
    "k0": 0,
    for (final [v4] in <List<num>>[[1], [2], [3]])
      "k$v4": v4.expectStaticType<Exactly<num>>(),
    "k4": 4
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, m4);

  var m5 = {
    "k0": 0,
    for (var <String, num>{"k1": v5} in [{"k1": 1}]..store) "k$v5": v5,
    "k2": 2
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2}, m5);
  Expect.isTrue(Storing.stored is List<Map<String, num>>);
  Expect.isTrue(Storing.stored.first is Map<String, num>);
  Storing.stored.first["answer"] = 42;
  Storing.stored.first["pi"] = 3.14;

  var m6 = {
    "k0": 0,
    for (final {"k1": v6} in <Map<String, num>>[{"k1": 1}])
        "k$v6": v6.expectStaticType<Exactly<num>>(),
    "k2": 2
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2}, m6);

  var m7 = {
    "k0": 0,
    for (var (num v7, n: num v8) in [(1, n: 2)]..store) "k$v7": v7,
    "k2": 2
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2}, m7);
  Expect.isTrue(Storing.stored is List<(num, {num n})>);

  var m8 = {
    "k1": 1,
    for (final (v9, n: v10) in <(num, {num n})>[(1, n: 2)])
      "k$v10": v10.expectStaticType<Exactly<num>>(),
    "k3": 3
  };
  Expect.mapEquals({"k1": 1, "k2": 2, "k3": 3}, m8);

  var m9 = {
    for (var Square<Centimeter>(area: v11) in [Square(1)]..store) "k": v11,
  };
  Expect.mapEquals({"k": Unit<Centimeter>(1)}, m9);
  Expect.isTrue(Storing.stored is List<Square<Centimeter>>);

  var m10 = {
    for (final Square(area: v12) in <Square<Centimeter>>[Square<Centimeter>(1)])
      "k": v12.expectStaticType<Exactly<Unit<Centimeter>>>()
  };
  Expect.mapEquals({"k": Unit<Centimeter>(1)}, m10);
}
