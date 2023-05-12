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
/// assigned twice. Test an object pattern
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";

class Meta {
  const Meta();
}

main() {
  @Meta()
  final Square(areaAsInt: int a1, sizeAsInt: b1) = Square(1);
  a1 = 3;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  b1 = 4;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(:int areaAsInt, :sizeAsInt) = Square(1);
  areaAsInt = 2;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  sizeAsInt = 42;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
