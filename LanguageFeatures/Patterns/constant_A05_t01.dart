// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion constantPattern ::= booleanLiteral
///                   | nullLiteral
///                   | '-'? numericLiteral
///                   | stringLiteral
///                   | symbolLiteral
///                   | identifier
///                   | qualifiedName
///                   | constObjectExpression
///                   | 'const' typeArguments? '[' elements? ']'
///                   | 'const' typeArguments? '{' elements? '}'
///                   | 'const' '(' expression ')'
///
/// A constant pattern determines if the matched value is equal to the
/// constant's value. We don't allow all expressions here because many
/// expression forms syntactically overlap other kinds of patterns. We avoid
/// ambiguity while supporting terse forms of the most common constant
/// expressions like so:
/// ...
/// Other  must be marked const and surrounded by
/// parentheses. This avoids ambiguity with null-assert, logical-or, and
/// logical-and patterns. It also makes future extensions to patterns and
/// expressions less likely to collide.
///
/// @description Check constant expressions in constant patterns. Test switch
/// statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test(Object value) {
  switch (value) {
    case const (1 + 2):
      return "case =3";
    case const (2 - 1):
      return "case =1";
    case const (2 * 2):
      return "case =4";
    case const (30 ^ 2):
      return "case =28";
    case const (1 | 4):
      return "case =5";
    case const (1 & 4):
      return "case =0";
    case const (15 % 8):
      return "case =7";
    case const (19 ~/ 8):
      return "case =2";
    case const (19 >> 1):
      return "case =9";
    case const (87 >>> 1):
      return "case =43";
    case const (19 << 1):
      return "case =38";
    case const (-1 > 2):
      return "case =false";
    case const (-1 < 2):
      return "case =true";
    case const ("Lily" + " " "was" " " + "here"):
      return "case String";
    default:
      return "default";
  }
}

String test2(Object value) {
  switch (value) {
    case const (1 >= 2):
      return "case =false";
    case const (-1 <= 2):
      return "case =true";
    default:
      return "default";
  }
}

String test3(Object value) {
  switch (value) {
    case const (1 == -2):
      return "case =false";
    case const (1 != 2):
      return "case =true";
    default:
      return "default";
  }
}

main() {
  Expect.equals("case =3", test(3));
  Expect.equals("case =1", test(1));
  Expect.equals("case =4", test(4));
  Expect.equals("case =28", test(28));
  Expect.equals("case =5", test(5));
  Expect.equals("case =0", test(0));
  Expect.equals("case =7", test(7));
  Expect.equals("case =2", test(2));
  Expect.equals("case =9", test(9));
  Expect.equals("case =43", test(43));
  Expect.equals("case =38", test(38));
  Expect.equals("case =false", test(false));
  Expect.equals("case =true", test(true));
  Expect.equals("case String", test("Lily was here"));
  Expect.equals("default", test(""));
  Expect.equals("default", test(42));

  Expect.equals("case =false", test2(false));
  Expect.equals("case =true", test2(true));

  Expect.equals("case =false", test3(false));
  Expect.equals("case =true", test3(true));
}
