/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [??] operator only evaluates its second operand if the first
 * evaluates to [null], and the second operand must be a potentially constant
 * expression.
 * @description Checks that operator exception is thrown if the first [??] is
 * not [null] and the second one is incorrect in potentially constant
 * expression.
 * @author iarkh@unipro.ru
 */
class MyClass {
  final int a;
  const MyClass(int i1, String i2) : a = (i1 ?? i2.length + "abc");
//                                                          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
}
