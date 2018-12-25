/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [??] operator only evaluates its second operand if the first
 * evaluates to [null], and the second operand must be a potentially constant
 * expression.
 * @description Checks that operator [??] operators does not reject the second
 * operand if the first one is [null] in potentially constant expression.
 * Exception is thrown if constant constructor passes argument os incorrect
 * type.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=constant-update-2018
class MyClass {
  final int a;
  const MyClass(int i1, int i2) : a = (i1 ?? i2);
}

main() {
  const MyClass c2 = MyClass(null, "222"); //# 01: compile-time error
}
