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
/// @description Checks that if `I` is `dynamic` and runtime type of `I` is
/// `Iterable<T>` where `T` is assignable to `<pattern>` required type then
/// for-in element works as expected. Test a set literal
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";
import "patterns_lib.dart";

main() {
  var s1 = {
    0,
    for (var (num v1) in [1, 2, 3] as dynamic) v1,
    4
  };
  Expect.setEquals({0, 1, 2, 3, 4}, s1);
  s1.expectStaticType<Exactly<Set<num>>>();

  var s2 = {
    0,
    for (final (v2) in <num>[1, 2, 3] as dynamic)
      (1 > 2 ? v2.whatever : null, v2).$2,
    4
  };
  Expect.setEquals({0, 1, 2, 3, 4}, s2);
  s2.expectStaticType<Exactly<Set<dynamic>>>();

  var s3 ={
    0,
    for (var <num>[v3] in [[1], [2], [3]] as dynamic) v3,
    4
  };
  Expect.setEquals({0, 1, 2, 3, 4}, s3);
  s3.expectStaticType<Exactly<Set<num>>>();

  var s4 = {
    0,
    for (final [v4] in <List<num>>[[1], [2], [3]] as dynamic)
      (1 > 2 ? v4.whatever : null, v4).$2,
    4
  };
  Expect.setEquals({0, 1, 2, 3, 4}, s4);
  s4.expectStaticType<Exactly<Set<dynamic>>>();

  var s5 = {
    0,
    for (var <String, num>{"k1": v5} in [{"k1": 1}] as dynamic) v5,
    2
  };
  Expect.setEquals({0, 1, 2}, s5);
  s5.expectStaticType<Exactly<Set<num>>>();

  var s6 = {
    0,
    for (final {"k1": v6} in <Map<String, num>>[{"k1": 1}] as dynamic)
      (1 > 2 ? v6.whatever : null, v6).$2,
    2
  };
  Expect.setEquals({0, 1, 2}, s6);
  s6.expectStaticType<Exactly<Set<dynamic>>>();

  var s7 = {
    0,
    for (var (num v7, n: num v8) in [(1, n: 2)] as dynamic) v7,
    2
  };
  Expect.setEquals({0, 1, 2}, s7);
  s7.expectStaticType<Exactly<Set<num>>>();

  var s8 = {
    1,
    for (final (v9, n: v10) in <(num, {num n})>[(1, n: 2)] as dynamic)
      (1 > 2 ? v10.whatever : null, v10).$2,
    3
  };
  Expect.setEquals({1, 2, 3}, s8);
  s8.expectStaticType<Exactly<Set<dynamic>>>();

  var s9 = {
    for (var Square<Centimeter>(area: v11) in
      [Square<Centimeter>(1)] as dynamic) v11,
  };
  Expect.isTrue(s9.toList()[0] == 1);
  s9.expectStaticType<Exactly<Set<Unit<Centimeter>>>>();

  var s10 = {
    for (final Square(area: v12) in
      <Square<Centimeter>>[Square<Centimeter>(1)] as dynamic) v12
  };
  Expect.isTrue(s10.toList()[0] == 1);
  s10.expectStaticType<Exactly<Set<Unit<MetricUnits>>>>();
}
