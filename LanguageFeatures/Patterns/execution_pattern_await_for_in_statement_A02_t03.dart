// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// A statement of the form:
///
/// for (<keyword> <pattern> in <expression>) <statement>
///
/// Where <keyword> is var or final is treated like so:
/// 1. Let I be the static type of <expression>, inferred using context type
///   schema Iterable<P> where P is the context type schema of <pattern>.
/// 2. Calculate the element type of I:
///   i. If I implements Iterable<T> for some T then E is T.
///   ii. Else if I is dynamic then E is dynamic.
///   iii. Else it is a compile-time error.
/// 3. Type check <pattern> with matched value type E.
/// 4. If there are no compile-time errors, then execution proceeds as the
///   following code, where id1 and id2 are fresh identifiers:
/// ```dart
/// var id1 = <expression>;
/// var id2 = id1.iterator;
/// while (id2.moveNext()) {
///   <keyword> <pattern> = id2.current;
///   { <statement> }
/// }
/// ```
/// @description Checks that in an async for-in loop if `I` is `dynamic` and
/// runtime type of `I` is `Stream<T>` where `T` is not assignable to
/// `<pattern>` required type then a run-time error occurs
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() async {
  Expect.throws(() {
    await for (var (int v1)
        in Stream<num>.fromIterable([1, 2, 3.14]) as dynamic) {}
  });

  Expect.throws(() {
    await for (final <int>[v2] in Stream<List<num>>.fromIterable([
      [1],
      [2],
      [3]
    ]) as dynamic) {}
  });

  Expect.throws(() {
    await for (var <String, int>{"k1": v3}
        in Stream<Map<String, num>>.fromIterable([
      {"k1": 1}
    ]) as dynamic) {}
  });

  Expect.throws(() {
    await for (final (int v4,)
        in Stream<(num,)>.fromIterable([(1.1,)]) as dynamic) {}
  });

  Expect.throws(() {
    await for (var (n: int v5)
        in Stream<({num n})>.fromIterable([(n: 2.1)]) as dynamic) {}
  });

  Expect.throws(() {
    await for (var Square<Centimeter>(area: v6)
        in Stream.fromIterable([Circle(1)]) as dynamic) {}
  });

  Expect.throws(() {
    await for (final Square<Meter>(area: v7)
        in Stream<Square<Centimeter>>.fromIterable([Square<Centimeter>(1)])
            as dynamic) {}
  });
}
