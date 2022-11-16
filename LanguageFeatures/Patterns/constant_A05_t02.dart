// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion constantPattern ::= booleanLiteral
///                   | nullLiteral
///                   | numericLiteral
///                   | stringLiteral
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
/// Other constant expressions must be marked const and surrounded by
/// parentheses. This avoids ambiguity with null-assert, logical-or, and
/// logical-and patterns. It also makes future extensions to patterns and
/// expressions less likely to collide.
///
/// @description Check const constructors calls in a constant patterns. Test
/// if-case pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test(Object value) {
  if (value case const (1 + 2)) {
    return "case =3";
  }
  if (value case const (2 - 1)) {
    return "case =1";
  }
  if (value case const (2 * 2)) {
    return "case =4";
  }
  if (value case const (30 ^ 2)) {
    return "case =28";
  }
  if (value case const (1 | 4)) {
    return "case =5";
  }
  if (value case const (1 & 4)) {
    return "case =0";
  }
  if (value case const (15 % 8)) {
    return "case =7";
  }
  if (value case const (19 ~/ 8)) {
    return "case =2";
  }
  if (value case const (19 >> 1)) {
    return "case =9";
  }
  if (value case const (87 >>> 1)) {
    return "case =43";
  }
  if (value case const (19 << 1)) {
    return "case =38";
  }
  if (value case const (1 > 2)) {
    return "case =false";
  }
  if (value case const (1 < 2)) {
    return "case =true";
  }
  if (value case const ("Lily" + " " "was" " " + "here")) {
    return "case String";
  } else {
    return "default";
  }
}

String test2(Object value) {
  if (value case const (1 >= 2)) {
    return "case =false";
  }
  if (value case const (1 <= 2)) {
    return "case =true";
  } else {
    return "default";
  }
}

String test3(Object value) {
  if (value case const (1 == 2)) {
    return "case =false";
  }
  if (value case const (1 != 2)) {
    return "case =true";
  } else {
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
