/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [??] operator only evaluates its second operand if the first
 * evaluates to [null], and the second operand must be a potentially constant
 * expression.
 * @description Checks that operator [??] throws a error if the first operand is
 * not [null] and the second one is not a potentially constant.
 * @author iarkh@unipro.ru
 */

dynamic d1 = "12345";
dynamic d2 = 11;
int i = 14;
dynamic d;

const const1 = 0;
const const2 = "testme";

main() {
  const a1 = const1 ?? d1;
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

  const a2 = const2 ?? d2;
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

  const a3 = 14 ?? i;
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  const a4 = "12345" ?? d;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}
