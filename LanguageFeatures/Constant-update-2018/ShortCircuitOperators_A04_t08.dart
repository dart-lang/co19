/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Finally, the conditional [?]/[:] operator only evaluates one of
 * its branches, depending on whether the condition expression evaluates to
 * [true] or [false]. The other branch must also be a potentially constant
 * expression.
 * @description Checks that compile error is thrown if condition of conditional
 * operator [?]/[:] is [false] and the first operand is not a constant
 * expression.
 * @author iarkh@unipro.ru
 */

main() {
  String s1;
  const String str1 = false ? s1 : "OK";
//                            ^^
// [analyzer] unspecified
// [cfe] unspecified

  String s2 = "test";
  const String str2 = false ? s2 : "OK";
//                            ^^
// [analyzer] unspecified
// [cfe] unspecified

  dynamic d = "12345";
  const String str3 = false ? d : "OK";
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

  int i = 12345;
  const String str4 = false ? i : "OK";
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}
