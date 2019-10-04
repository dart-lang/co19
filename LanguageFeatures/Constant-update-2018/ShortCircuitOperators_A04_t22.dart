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
 * @description Checks that conditional operator [?]/[:] in constant expression
 * throws a compile error if some operand is not a constant expression.
 * @author iarkh@unipro.ru
 */

String s = "not a constant";

main() {
  const String str1 = true ? s : "constant";
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

  const String str2 = true ? "constant" : s;
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified

  const String str3 = false ? s : "constant";
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

  const String str4 = false ? "constant" : s;
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified

}
