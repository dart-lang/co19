/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [??] operator only evaluates its second operand if the first
 * evaluates to [null], and the second operand must be a potentially constant
 * expression.
 * @description Checks that operator [??] in constant expression throws a
 * compile error if the first operand is not constant.
 * @author iarkh@unipro.ru
 */

int nonConst_i = 1;
Null nonConst_null = null;
dynamic nonConst_null_1 = null;
dynamic nonConst;
String nonConst_str = "";

const dynamic d1 = "12345";
const dynamic d2 = 11;
const int i = 14;

main() {
  const int a1 = nonConst_i ?? 1;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const a2 = nonConst_null ?? "incorrect";
//           ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const a3 = nonConst_null_1 ?? "incorrect";
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const a4 = nonConst ?? 9;
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const a5 = nonConst_str ?? "145";
//           ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
