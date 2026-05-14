// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
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
/// not valid in a `guardedPattern` and produce a compile-time error.
/// @author sgrekhov22@gmail.com
/// @issue 63356

class C {
  static const a = 1, b = 2;
}

int test(Object value) {
  switch (value) {
    case C.a + C.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 1;
    case C.a - C.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 2;
    case C.a * C.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 3;
    case C.a / C.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 4;
    case C.a ^ C.b:     // ignore: unreachable_switch_case
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 5;
    case C.a | C.b:     // ignore: unreachable_switch_case
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 6;
    case C.a & C.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 7;
    case C.a % C.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 8;
    case C.a ~/ C.b:    // ignore: unreachable_switch_case
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
      return 9;
    case C.a >> C.b:    // ignore: unreachable_switch_case
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
      return 10;
    case C.a >>> C.b:   // ignore: unreachable_switch_case
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return 11;
    case C.a << C.b:
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
      return 12;
    case C.a > C.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 13;
    case C.a < C.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 14;
    case C.a >= C.b:    // ignore: unreachable_switch_case
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
      return 15;
    case C.a <= C.b:   // ignore: unreachable_switch_case
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
      return 16;
    case C.a == C.b:   // ignore: unreachable_switch_case
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
      return 17;
    case C.a != C.b:    // ignore: unreachable_switch_case
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
      return 18;
    default:
      return 0;
  }
}

main() {
  print(test);
}
