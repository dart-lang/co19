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
/// @description Check valid variable declaration pattern. Test a parenthesized
/// pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

class Meta {
  const Meta();
}

main() {
  @Meta()
  var ((a1, _) && r1) = (1, 2);
  Expect.equals(1, a1);
  Expect.equals(1, r1.$1);
  Expect.equals(2, r1.$2);
  a1 = 3;

  var ((num a2, n: String b2) && (num, {String n}) r2) = (3.14, n: "pi");
  Expect.equals(3.14, a2);
  Expect.equals("pi", b2);
  Expect.equals(3.14, r2.$1);
  Expect.equals("pi", r2.n);
  a2 = 2.71;
  b2 = "e";

  @Meta()
  final ((_, b3) && r3) = (1, 2);
  Expect.equals(2, b3);
  Expect.equals(1, r3.$1);
  Expect.equals(2, r3.$2);

  final ((num a4, n: String b4) && (num, {String n}) r4) = (3.14, n: "pi");
  Expect.equals(3.14, a4);
  Expect.equals("pi", b4);
  Expect.equals(3.14, r4.$1);
  Expect.equals("pi", r4.n);
}
