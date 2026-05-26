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
/// @description Check that binary operator expressions derived from
/// `bitwiseOrExpression` are not valid in a `guardedPattern` and produce a
/// compile-time error. Test a library prefix.
/// @author sgrekhov22@gmail.com
/// @issue 63356

import 'switch_statement_A05_t04_lib.dart' as p;

int test(Object value) {
  switch (value) {
    case p.a + p.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 1;
    case p.a - p.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 2;
    case p.a * p.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 3;
    case p.a / p.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 4;
    case p.a ^ p.b:     // ignore: unreachable_switch_case
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 5;
    case p.a | p.b:     // ignore: unreachable_switch_case
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 6;
    case p.a & p.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 7;
    case p.a % p.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 8;
    case p.a ~/ p.b:    // ignore: unreachable_switch_case
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
      return 9;
    case p.a >> p.b:    // ignore: unreachable_switch_case
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
      return 10;
    case p.a >>> p.b:   // ignore: unreachable_switch_case
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return 11;
    case p.a << p.b:
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
      return 12;
    case p.a > p.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 13;
    case p.a < p.b:
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      return 14;
    case p.a >= p.b:    // ignore: unreachable_switch_case
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
      return 15;
    case p.a <= p.b:   // ignore: unreachable_switch_case
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
      return 16;
    case p.a == p.b:   // ignore: unreachable_switch_case
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
      return 17;
    case p.a != p.b:    // ignore: unreachable_switch_case
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
