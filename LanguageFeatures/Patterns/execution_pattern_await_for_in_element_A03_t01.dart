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
/// to `<expression>` and from `<expression>` to `<pattern>`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";
import "patterns_lib.dart";

extension Storing on Object? {
  static dynamic stored;
  void get store => stored = this;
}

main() async {
  var l1 = [
    0,
    await for (var (num v1) in Stream.fromIterable([1, 2, 3])..store) v1,
    4
  ];
  Expect.listEquals([0, 1, 2, 3, 4], l1);
  Expect.isTrue(Storing.stored is Stream<num>);

  var l2 = [
    0,
    await for (final (v2) in Stream<num>.fromIterable([1, 2, 3]))
      v2.expectStaticType<Exactly<num>>(),
    4
  ];
  Expect.listEquals([0, 1, 2, 3, 4], l2);

  var l3 = [
    0,
    await for (var <num>[v3] in Stream.fromIterable([
      [1],
      [2],
      [3]
    ])..store) v3,
    4
  ];
  Expect.listEquals([0, 1, 2, 3, 4], l3);
  Expect.isTrue(Storing.stored is Stream<List<num>>);

  var l4 = [
    0,
    await for (final [v4] in Stream<List<num>>.fromIterable([
      [1],
      [2],
      [3]
    ])) v4.expectStaticType<Exactly<num>>(),
    4
  ];
  Expect.listEquals([0, 1, 2, 3, 4], l4);

  var l5 = [
    0,
    await for (var <String, num>{"k1": v5} in Stream.fromIterable([
      {"k1": 1}
    ])..store) v5,
    2
  ];
  Expect.listEquals([0, 1, 2], l5);
  Expect.isTrue(Storing.stored is Stream<Map<String, num>>);

  var l6 = [
    0,
    await for (final {"k1": v6} in Stream<Map<String, num>>.fromIterable([
      {"k1": 1}
    ])) v6.expectStaticType<Exactly<num>>(),
    2
  ];
  Expect.listEquals([0, 1, 2], l6);

  var l7 = [
    0,
    await for (var (num v7, n: num v8)
        in Stream.fromIterable([(1, n: 2)])..store) v7 + v8,
    2
  ];
  Expect.listEquals([0, 3, 2], l7);
  Expect.isTrue(Storing.stored is Stream<(num, {num n})>);

  var l8 = [
    1,
    await for (final (v9, n: v10)
        in Stream<(num, {num n})>.fromIterable([(1, n: 2)]))
      v10.expectStaticType<Exactly<num>>(),
    3
  ];
  Expect.listEquals([1, 2, 3], l8);

  var l9 = [
    await for (var Square<Centimeter>(area: v11)
        in Stream.fromIterable([Square(1)])..store)
      v11,
  ];
  Expect.listEquals([Unit<Centimeter>(1)], l9);
  Expect.isTrue(Storing.stored is Stream<Square<Centimeter>>);

  var l10 = [
    await for (final Square(area: v12)
        in Stream<Square<Centimeter>>.fromIterable([Square<Centimeter>(1)]))
      v12.expectStaticType<Exactly<Unit<Centimeter>>>()
  ];
  Expect.listEquals([Unit<Centimeter>(1)], l10);
}
