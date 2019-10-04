/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Likewise the [||] operator only evaluates its second operand if
 * the first evaluates to [false], and the second operand must be a potentially
 * constant expression.
 * @description Checks that compiler does not attempt to calculate the
 * second operand of [||] operation if the first one is [true] in the constant
 * expression.
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

const int i = 25;

class MyClass {
  final bool b;
  const MyClass() : b = true || (null as String).length > 14;
}

main() {
  const bool a1 = (i > 0) || ((null as String).length > 14);
  Expect.isTrue(a1);

  const bool a2 = true || ((null as String).length > 14);
  Expect.isTrue(a2);

  const MyClass c1 = MyClass();
  Expect.isTrue(c1.b);
}
