/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Likewise the [||] operator only evaluates its second operand if
 * the first evaluates to [false], and the second operand must be a potentially
 * constant expression.
 * @description Checks that [||] throws error if the first operand of [||]
 * operation is not [bool] or it is [true] and the second one is incorrect in
 * the potentially constant expression.
 * @compile-error
 * @author iarkh@unipro.ru
 */
const int i = 25;

class MyClass {
  final bool b;
  const MyClass(Object b) : b = false || ((b as int) < 23);
}

main() {
  const MyClass c1 = MyClass("testme"); // #01: compile-time error
}
