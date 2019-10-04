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
 * operator [?]/[:] is [true] and the second one is not a correct constant
 * expression in potentially constant expression.
 * @author iarkh@unipro.ru
 */

class MyClass {
  final int res;
  const MyClass(String test) : res = (true ? 11 : test + 11);
//                                                       ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
}
