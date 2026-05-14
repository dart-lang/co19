// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
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
/// expressions.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String test(Object value) {
  final x = switch (value) {
    const (1 + 2) => "case =3",
    const (2 - 1) => "case =1",
    const (2 * 2) => "case =4",
    const (2 / 1) => "case =2",
    const (30 ^ 2) => "case =28",
    const (1 | 4) => "case =5",
    const (1 & 4) => "case =0",
    const (15 % 8) => "case =7",
    const (19 ~/ 8) => "case =2",
    const (19 >> 1) => "case =9",
    const (87 >>> 1) => "case =43",
    const (19 << 1) => "case =38",
    const (-1 > 2) => "case =false",
    const (-1 < 2) => "case =true",
    const ("Lily" +
        " "
            "was"
            " " +
        "here") =>
      "case String",
    _ => "default",
  };
  return x;
}

String test2(Object value) {
  final x = switch (value) {
    const (1 >= 2) => "case =false",
    const (-1 <= 2) => "case =true",
    _ => "default",
  };
  return x;
}

String test3(Object value) {
  final x = switch (value) {
    const (1 == -2) => "case =false",
    const (1 != 2) => "case =true",
    _ => "default",
  };
  return x;
}

main() {
  Expect.equals("case =3", test(3));
  Expect.equals("case =1", test(1));
  Expect.equals("case =4", test(4));
  Expect.equals("case =2", test(2));
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
