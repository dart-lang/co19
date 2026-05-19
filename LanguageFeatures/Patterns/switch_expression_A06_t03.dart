// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// ```
/// primary                 ::= // Existing productions...
///                           | switchExpression
///
/// switchExpression      ::= 'switch' '(' expression ')' '{'
///                           switchExpressionCase ( ',' switchExpressionCase )*
///                           ','? '}'
/// switchExpressionCase  ::= guardedPattern '=>' expression
/// ```
/// @description Checks that pure `bitwiseOrExpression` constant expressions are
/// not valid in a `guardedPattern` and produce a compile-time error. Test a
/// library prefix.
/// @author sgrekhov22@gmail.com
/// @issue 63356

import 'switch_expression_A06_t03_lib.dart' as p;

void test(Object value) {
  var x = switch (value) {
    p.a + p.b => 1,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    p.a - p.b => 2,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    p.a * p.b => 3,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    p.a / p.b => 4,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    p.a ^ p.b => 5,   // ignore: unreachable_switch_case
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    p.a | p.b => 6,   // ignore: unreachable_switch_case
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    p.a & p.b => 7,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    p.a % p.b => 8,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    p.a ~/ p.b => 9,    // ignore: unreachable_switch_case
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    p.a >> p.b => 10,    // ignore: unreachable_switch_case
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    p.a >>> p.b => 11,  // ignore: unreachable_switch_case
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
    p.a << p.b => 12,
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    p.a > p.b => 13,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    p.a < p.b => 14,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    p.a >= p.b => 15,   // ignore: unreachable_switch_case
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    p.a <= p.b => 16,   // ignore: unreachable_switch_case
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    p.a == p.b => 17,   // ignore: unreachable_switch_case
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    p.a != p.b => 18,   // ignore: unreachable_switch_case
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => 0,
  };
}

main() {
  print(test);
}
