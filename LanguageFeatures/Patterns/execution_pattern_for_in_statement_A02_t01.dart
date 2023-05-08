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
/// @description Checks that it is a compile-time error if the type check ot the
/// `<pattern>` with matched value `E` fails
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  for (var (int v1) in <num>[1, 2, 3]) {}
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  for (final <int>[v2] in <List<num>>[[1], [2], [3]]) {}
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  for (var <String, int>{"k1": v3} in <Map<String, num>>[{"k1": 1}]) {}
//         ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  for (final (int v4,) in <(num,)>[(1,)]) {}
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  for (var (n: int v5) in <({num n})>[(n: 2)]) {}
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  for (var Square<Centimeter>(area: v6) in <Square<Meter>>[Square<Meter>(1)]) {}
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
