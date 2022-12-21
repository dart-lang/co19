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
/// @description Check that it is a compile-time error if final variable is
/// assigned twice. Test a list pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

class Meta {
  const Meta();
}

main() {
  @Meta()
  final [a1, b1] = [1, 2];
  a1 = 42;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  b1 = 42;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  final [int a2, b2, ...List<int> c2] = [3, 4, 5, 6];
  a2 = 42;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  b2 = 42;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  c2 = [1, 2];
//^^
// [analyzer] unspecified
// [cfe] unspecified

  final <int>[a3, b3, ...c3] = [5, 6, 7, 8];
  a3 = 42;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  b3 = 42;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  c3 = [1, 2];
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
