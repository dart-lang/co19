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
/// @description Checks that it is a compile-time error if a final variable
/// declared by the pattern is assigned in an async for-in element. Test a set
/// literal
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() async {
  var s1 = {
    await for (final (int v1) in Stream.fromIterable([1, 2, 3])) v1++
//                                                               ^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  var s2 = {
    await for (final <int>[v2] in Stream.fromIterable([[1], [2], [3]])) v2++
//                                                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  var s3 = {
    await for (final <String, int>{"k1": v3} in Stream.fromIterable([{"k1": 1}])) v3++
//                                                                                ^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  var s4 = {
    await for (final (int v4,) in Stream.fromIterable([(1,)])) v4++
//                                                             ^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  var s5 = {
    await for (final (n: int v5) in Stream.fromIterable([(n: 2)])) v5++
//                                                                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  var s6 = {
    await for (final Square(area: v6) in Stream.fromIterable([Square(1)])) v6++
//                                                                         ^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
