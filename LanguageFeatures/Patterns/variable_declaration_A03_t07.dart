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
/// @description Check valid variable declaration pattern. Test a record
/// pattern
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class Meta {
  const Meta();
}

main() {
  @Meta()
  var (a1, _) = (1, 2);
  Expect.equals(1, a1);
  a1 = 3;

  var (num a2, n: String b2) = (3.14, n: "pi");
  Expect.equals(3.14, a2);
  Expect.equals("pi", b2);
  a2 = 2.71;
  b2 = "e";

  var (n1: String a3, n2: int b3) = (n1: "x", n2: 42);
  Expect.equals("x", a3);
  Expect.equals(42, b3);
  a3 = "y";
  b3 = 0;

  var (:String n1, :n2) = (n1: "x", n2: 42);
  Expect.equals("x", n1);
  Expect.equals(42, n2);
  n1 = "y";
  n2 = 0;

  @Meta()
  final (_, a4, _) = (0, 1, 2);
  Expect.equals(1, a4);

  final (num a5, n: String b5) = (3.14, n: "pi");
  Expect.equals(3.14, a5);
  Expect.equals("pi", b5);

  final (n1: String a6, n2: int b6) = (n1: "x", n2: 42);
  Expect.equals("x", a6);
  Expect.equals(42, b6);

  final (:String n3, :n4) = (n3: "x", n4: 42);
  Expect.equals("x", n3);
  Expect.equals(42, n4);
}
