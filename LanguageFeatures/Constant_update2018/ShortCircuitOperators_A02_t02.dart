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
 * operation is not [bool] or it is [false] and the second one is incorrect in
 * constant expression.
 * @compile-error
 * @author iarkh@unipro.ru
 */
const int i = 25;

class MyClass {
  final bool b;
  const MyClass() : b = false || (null as String).length; // #01: compile-time error
}

main() {
  const bool a1 = 128 || (i < 0);        // #02: compile-time error
  const bool a2 = "test" || false;       // #03: compile-time error
  const bool a3 = false || "test".length; // #04: compile-time error
}
