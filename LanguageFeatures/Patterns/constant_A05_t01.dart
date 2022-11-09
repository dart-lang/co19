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
/// @description Check const constructors calls in a constant patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test(Object value) {
  switch (value) {
    case const (1 + 2):
      return "case 1";
    case const ("Lily" + " " "was" " " + "here"):
      return "case 2";
    case const (2 * 2):
      return "case 3";
    case const (1 | 4):
      return "case 4";
    case const (1 & 4):
      return "case 5";
    default:
      return "default";
  }
}

main() {
  Expect.equals("case 1", test(3));
  Expect.equals("case 2", test("Lily was here"));
  Expect.equals("case 3", test(4));
  Expect.equals("case 4", test(5));
  Expect.equals("case 5", test(0));
  Expect.equals("default", test(""));
  Expect.equals("default", test(42));
  Expect.equals("default", test(true));
}
