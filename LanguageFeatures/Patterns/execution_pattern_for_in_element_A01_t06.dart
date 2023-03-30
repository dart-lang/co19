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
/// for-in element works as expected. Test a map literal
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";
import "patterns_lib.dart";

main() {
  var m1 = {
    "k0": 0,
    for (var (num v1) in [1, 2, 3] as dynamic) "k$v1": v1,
    "k4": 4
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, m1);
  m1.expectStaticType<Exactly<Map<String, num>>>();

  var m2 = {
    "k0": 0,
    for (final (v2) in <num>[1, 2, 3] as dynamic)
      "k$v2": (1 > 2 ? v2.whatever : null, v2).$2,
    "k4": 4
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, m2);
  m2.expectStaticType<Exactly<Map<String, dynamic>>>();

  var m3 ={
    "k0": 0,
    for (var <num>[v3] in [[1], [2], [3]] as dynamic) "k$v3": v3,
    "k4": 4
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, m3);
  m3.expectStaticType<Exactly<Map<String, num>>>();

  var m4 = {
    "k0": 0,
    for (final [v4] in <List<num>>[[1], [2], [3]] as dynamic)
      "k$v4": (1 > 2 ? v4.whatever : null, v4).$2,
    "k4": 4
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, m4);
  m4.expectStaticType<Exactly<Map<String, dynamic>>>();

  var m5 = {
    "k0": 0,
    for (var <String, num>{"k1": v5} in [{"k1": 1}] as dynamic) "k$v5": v5,
    "k2": 2
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2}, m5);
  m5.expectStaticType<Exactly<Map<String, num>>>();

  var m6 = {
    "k0": 0,
    for (final {"k1": v6} in <Map<String, num>>[{"k1": 1}] as dynamic)
      "k$v6": (1 > 2 ? v6.whatever : null, v6).$2,
    "k2": 2
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2}, m6);
  m6.expectStaticType<Exactly<Map<String, dynamic>>>();

  var m7 = {
    "k0": 0,
    for (var (num v7, n: num v8) in [(1, n: 2)] as dynamic) "k$v7": v7,
    "k2": 2
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2}, m7);
  m7.expectStaticType<Exactly<Map<String, num>>>();

  var m8 = {
    "k1": 1,
    for (final (v9, n: v10) in <(num, {num n})>[(1, n: 2)] as dynamic)
      "k$v10": (1 > 2 ? v10.whatever : null, v10).$2,
    "k3": 3
  };
  Expect.mapEquals({"k1": 1, "k2": 2, "k3": 3}, m8);
  m8.expectStaticType<Exactly<Map<String, dynamic>>>();

  var m9 = {
    for (var Square<Centimeter>(area: v11) in
      [Square<Centimeter>(1)] as dynamic) "k": v11,
  };
  Expect.isTrue(m9["k"] == 1);
  m9.expectStaticType<Exactly<Map<String, Unit<Centimeter>>>>();

  var m10 = {
    for (final Square(area: v12) in
      <Square<Centimeter>>[Square<Centimeter>(1)] as dynamic) "k": v12
  };
  Expect.isTrue(m10["k"] == 1);
  m10.expectStaticType<Exactly<Map<String, Unit<MetricUnits>>>>();
}
