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
 * operation is [true] and the second one is not [bool] in the potentially
 * constant expression.
 * @author iarkh@unipro.ru
 */
const int i = 25;

class MyClass {
  final bool b;
  const MyClass(Object o) : b = true || (o as int);
//                                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}

main() {}
