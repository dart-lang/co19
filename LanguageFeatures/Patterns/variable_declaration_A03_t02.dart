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
/// @description Check that it is a compile-time error if a final variable is
/// assigned twice. Test a parenthesized pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

class Meta {
  const Meta();
}

main() {
  @Meta()
  final ((a1, b1) && r1) = (1, 2);
  a1 = 3;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  b1 = 4;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  final ((num a2, n: String b2) && (num, {String n}) r2) = (3.14, n: "pi");
  a2 = 2.71;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  b2 = "e";
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
