// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We extend switch statements to allow patterns in cases:
///
/// switchStatement         ::= 'switch' '(' expression ')'
///                         '{' switchStatementCase* switchStatementDefault? '}'
/// switchStatementCase     ::= label* 'case' guardedPattern ':' statements
/// guardedPattern          ::= pattern ( 'when' expression )?
/// switchStatementDefault  ::= label* 'default' ':' statements
/// ...
/// Many constant expressions are subsumed by the new pattern syntax so most
/// existing switch cases have the same semantics under this proposal. However,
/// patterns are not a strict superset of constant expressions and some switches
/// may be broken.
/// ...
/// Other constant expressions. Constant patterns allow simple literals and
/// references to named constants to be used directly as patterns, which covers
/// the majority of all existing switch cases. Also a constant constructor
/// explicitly prefixed with const is a valid constant expression pattern. But
/// some more complex expressions are valid constant expressions but not valid
/// constant patterns.
///
/// @description Checks that pure `bitwiseOrExpression` constant expressions are
/// allowed in a switch case statements in a language version before 3.0.
/// @author sgrekhov22@gmail.com

// @dart=2.19

int test(Object value) {
  switch (value) {
    case 1 + 2:
      return 1;
    case 2 - 1:
      return 2;
    case 2 * 2:
      return 3;
    case 30 ^ 2:
      return 4;
    case 1 | 4:
      return 5;
    case 1 & 4:
      return 6;
    case 15 % 8:
      return 7;
    case 19 ~/ 8:
      return 8;
    case 19 >> 1:
      return 9;
    case 87 >>> 1:
      return 10;
    case 19 << 1:
      return 11;
    case -1 > 2:
      return 12;
    case -1 < 2:
      return 13;
    case 1 >= 2:    // ignore: unreachable_switch_case
      return 14;
    case -1 <= 2:   // ignore: unreachable_switch_case
      return 15;
    case 1 == -2:   // ignore: unreachable_switch_case
      return 16;
    case 1 != 2:    // ignore: unreachable_switch_case
      return 17;
    case "Lily" + " " "was" " " + "here":
      return 18;
    case List<int>:
      return 19;
    default:
      return 0;
  }
}

main() {
  test(42);
}
