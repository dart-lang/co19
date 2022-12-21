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
/// @description Check valid variable declaration pattern. Test an object
/// pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";
import "patterns_lib.dart";

class Meta {
  const Meta();
}

main() {
  @Meta()
  var Square(areaAsInt: int a1, sizeAsInt: _) = Square(1);
  Expect.equals(1, a1);
  a1 = 3;

  var Square(areaAsInt: a2, sizeAsInt: int b2) = Square(2);
  Expect.equals(4, a2);
  Expect.equals(2, b2);
  a2 = 5;
  b2 = 6;

  var Square(:areaAsInt,: int sizeAsInt) = Square(3);
  Expect.equals(9, areaAsInt);
  Expect.equals(3, sizeAsInt);
  areaAsInt = 5;
  sizeAsInt = 6;

  @Meta()
  final Square(areaAsInt: int a3, sizeAsInt: _) = Square(1);
  Expect.equals(1, a3);

  final Square(areaAsInt: a4, sizeAsInt: int b4) = Square(2);
  Expect.equals(4, a4);
  Expect.equals(2, b4);

  final Square(:areaAsDouble,: double sizeAsDouble) = Square(3);
  Expect.equals(9, areaAsDouble);
  Expect.equals(3, sizeAsDouble);
}
