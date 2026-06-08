// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We replace the existing ifStatement rule with:
/// ```
/// ifStatement ::= ifCondition statement ('else' statement)?
/// ifCondition :== 'if' '(' expression ( 'case' guardedPattern )? ')'
/// ```
/// @description Check that binary operator expressions derived from
/// `bitwiseOrExpression` are not valid in a `guardedPattern` and produce a
/// compile-time error.
/// @author sgrekhov22@gmail.com
/// @issue 63356

import 'if_case_A03_t03_lib.dart' as p;

void test(Object value) {
  if (value case p.a + p.b) {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a - p.b) {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a * p.b) {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a / p.b) {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a ^ p.b) {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a | p.b) {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a & p.b) {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a % p.b) {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a ~/ p.b) {}
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a >> p.b) {}
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a >>> p.b) {}
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a << p.b) {}
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a > p.b) {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a < p.b) {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a >= p.b) {}
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a <= p.b) {}
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a == p.b) {}
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (value case p.a != p.b) {}
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test);
}
