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
/// @description Check that binary operator expressions derived from
/// `bitwiseOrExpression` are not valid in a `guardedPattern` and produce a
/// compile-time error.
/// @author sgrekhov22@gmail.com
/// @issue 63356

class C {
  static const a = 1, b = 2;
}

void test(Object value) {
  var x = switch (value) {
    C.a + C.b => 1,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    C.a - C.b => 2,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    C.a * C.b => 3,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    C.a / C.b => 4,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    C.a ^ C.b => 5,   // ignore: unreachable_switch_case
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    C.a | C.b => 6,   // ignore: unreachable_switch_case
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    C.a & C.b => 7,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    C.a % C.b => 8,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    C.a ~/ C.b => 9,    // ignore: unreachable_switch_case
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    C.a >> C.b => 10,    // ignore: unreachable_switch_case
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    C.a >>> C.b => 11,  // ignore: unreachable_switch_case
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
    C.a << C.b => 12,
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    C.a > C.b => 13,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    C.a < C.b => 14,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    C.a >= C.b => 15,   // ignore: unreachable_switch_case
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    C.a <= C.b => 16,   // ignore: unreachable_switch_case
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    C.a == C.b => 17,   // ignore: unreachable_switch_case
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    C.a != C.b => 18,   // ignore: unreachable_switch_case
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => 0,
  };
}

main() {
  print(test);
}
