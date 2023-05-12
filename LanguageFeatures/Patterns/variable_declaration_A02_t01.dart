// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// patternVariableDeclaration ::= ('final' | 'var') outerPattern '=' expression
///
/// outerPattern                ::= parenthesizedPattern
///                               | listPattern
///                               | mapPattern
///                               | recordPattern
///                               | objectPattern
///
/// @description Check that it is a compile-time error to have
/// ('final' | 'var') pattern '=' expression when the given pattern isn't an
/// outerPattern.
/// @author sgrekhov22@gmail.com

main() {
  var [a1] || [_] = ["Logical-or pattern"];
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final [a1] && [_] = ["Logical-and pattern"];
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var >= 0 = 1;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

  final str as String = "Cast pattern";
//      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var n1? = "Null-check pattern";
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  final n2! = "Null-assert pattern";
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var null = "Constant pattern";
//    ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final "null" = "Constant pattern";
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var String s1 = "Variable pattern";
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var String _ = "Variable pattern";
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
