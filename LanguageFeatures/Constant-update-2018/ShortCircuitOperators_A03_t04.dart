/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [??] operator only evaluates its second operand if the first
 * evaluates to [null], and the second operand must be a potentially constant
 * expression.
 * @description Checks that compile-time exception is thrown if the first
 * operand of [??] operator is [null] and the second one has incorrect type in
 * the constant expression.
 * @author iarkh@unipro.ru
 */

const dynamic d1 = 11;
const String d2 = "check me here";
const nil = null;

main() {
  const String s1 = null ?? 124;
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const int i1 = nil ?? "";
//          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const String s2 = null ?? d1;
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const int i2 = nil ?? d2;
//          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
