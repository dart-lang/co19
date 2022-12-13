// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// recordPattern         ::= '(' patternFields? ')'
/// patternFields         ::= patternField ( ',' patternField )* ','?
/// patternField          ::= ( identifier? ':' )? pattern
/// ...
/// It is a compile-time error if a name cannot be inferred for a named field
/// pattern with the field name omitted
///
/// @description Checks that it is a compile-time error if a name cannot be
/// inferred for a named field pattern with the field name omitted. Test non
/// variable, null check/assert, cast or parenthesis patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

test(dynamic r) {
  var (:n1 || n1) = r;
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final (:n2 || n2) = r;
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (: > 0) = r;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  final (: == 0) = r;
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (:42) = r;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  final (:42) = r;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified

  var (:[l1]) = r;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final (:[l2]) = r;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (:{1: m1}) = r;
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final (:{2: m2}) = r;
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (:(n:r1, r2)) = r;
//      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final (:(n:r3, r4)) = r;
//        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (:Square(size: o1)) = r;
//      ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final (:Square(size: o2)) = r;
//        ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  test((name: "pi", 3.14));
}
