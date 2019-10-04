/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Likewise the [||] operator only evaluates its second operand if
 * the first evaluates to [false], and the second operand must be a potentially
 * constant expression.
 * @description Checks that [||] throws error if the first operand of [||]
 * operation is [false] and the second one is not a constant expression.
 * @author iarkh@unipro.ru
 */

const int i = 25;
bool b = false;
dynamic d;
int j = 4;

main() {
  const bool a1 = false || b;
//                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const bool a2 = (i < 0) || b;
//                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const bool a3 = false || d < 11;
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const bool a4 = (i == 2) || (j == 4);
//                ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
