/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Likewise the [||] operator only evaluates its second operand if
 * the first evaluates to [false], and the second operand must be a potentially
 * constant expression.
 * @description Checks that compile error is thrown if the first [||] operand is
 * [true] and the second one is not [bool] in the constant expression.
 * @author iarkh@unipro.ru
 */

const int i = 25;

main() {
  const bool a1 = (i > 0) || (null as String).length;
//                           ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
