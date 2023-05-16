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
/// @description Checks that in an async for-in element if `I` implements
/// `Stream<T>` for some `T` then `E` is `T`. Test `T` inferred from `<pattern>`
/// to `<expression>` and from `<expression>` to `<pattern>`. Check a map
/// literal
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";
import "patterns_lib.dart";

extension Storing on Object? {
  static dynamic stored;
  void get store => stored = this;
}

main() async {
  var m1 = {
    "k0": 0,
    await for (var (num v1) in Stream.fromIterable([1, 2, 3])..store)
      "k$v1": v1,
    "k4": 4
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, m1);
  Expect.isTrue(Storing.stored is Stream<num>);

  var m2 = {
    "k0": 0,
    await for (final (v2) in Stream<num>.fromIterable([1, 2, 3]))
      "k$v2": v2.expectStaticType<Exactly<num>>(),
    "k4": 4
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, m2);

  var m3 = {
    "k0": 0,
    await for (var <num>[v3] in Stream.fromIterable([
      [1],
      [2],
      [3]
    ])..store) "k$v3": v3,
    "k4": 4
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, m3);
  Expect.isTrue(Storing.stored is Stream<List<num>>);

  var m4 = {
    "k0": 0,
    await for (final [v4] in Stream<List<num>>.fromIterable([
      [1],
      [2],
      [3]
    ]))
      "k$v4": v4.expectStaticType<Exactly<num>>(),
    "k4": 4
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4}, m4);

  var m5 = {
    "k0": 0,
    await for (var <String, num>{"k1": v5} in Stream.fromIterable([
      {"k1": 1}
    ])..store) "k$v5": v5,
    "k2": 2
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2}, m5);
  Expect.isTrue(Storing.stored is Stream<Map<String, num>>);

  var m6 = {
    "k0": 0,
    await for (final {"k1": v6} in Stream<Map<String, num>>.fromIterable([
      {"k1": 1}])) "k$v6": v6.expectStaticType<Exactly<num>>(),
    "k2": 2
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2}, m6);

  var m7 = {
    "k0": 0,
    await for (var (num v7, n: num v8)
        in Stream.fromIterable([(1, n: 2)])..store)
      "k$v7": v7,
    "k2": 2
  };
  Expect.mapEquals({"k0": 0, "k1": 1, "k2": 2}, m7);
  Expect.isTrue(Storing.stored is Stream<(num, {num n})>);

  var m8 = {
    "k1": 1,
    await for (final (v9, n: v10)
        in Stream<(num, {num n})>.fromIterable([(1, n: 2)]))
      "k$v10": v10.expectStaticType<Exactly<num>>(),
    "k3": 3
  };
  Expect.mapEquals({"k1": 1, "k2": 2, "k3": 3}, m8);

  var m9 = {
    await for (var Square<Centimeter>(area: v11)
        in Stream.fromIterable([Square(1)])..store)
      "k": v11,
  };
  Expect.mapEquals({"k": Unit<Centimeter>(1)}, m9);
  Expect.isTrue(Storing.stored is Stream<Square<Centimeter>>);

  var m10 = {
    await for (final Square(area: v12)
        in Stream<Square<Centimeter>>.fromIterable([Square<Centimeter>(1)]))
      "k": v12.expectStaticType<Exactly<Unit<Centimeter>>>()
  };
  Expect.mapEquals({"k": Unit<Centimeter>(1)}, m10);
}
