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
 * operand of [??] operator is of incorrect type.
 * @author iarkh@unipro.ru
 */

const int i = 1;

const String nil = null;
const String str = "check me here";

main() {
  const String s1 = 14 ?? "12345";
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

  const String s2 = i ?? "12345";
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

  const int i1 = "12345" ?? 12345;
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

  const int res = str ?? 12345;
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

}
