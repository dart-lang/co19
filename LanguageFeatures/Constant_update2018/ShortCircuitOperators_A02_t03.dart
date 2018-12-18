/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Likewise the [||] operator only evaluates its second operand if
 * the first evaluates to [false], and the second operand must be a potentially
 * constant expression.
 * @description Checks that [||] does not attempt to calculate the second
 * operand of [||] operation if the first one is [false] in the potentially
 * constant expression.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=constant-update-2018
import "../../Utils/expect.dart";

const int i = 25;

class MyClass {
  final bool b;
  const MyClass(Object b) : b = true || ((b as int) > 25);
}

main() {
  const MyClass c1 = MyClass("testme");
  Expect.isFalse(c1.b);
}
