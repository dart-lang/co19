/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [??] operator only evaluates its second operand if the first
 * evaluates to [null], and the second operand must be a potentially constant
 * expression.
 * @description Checks that operator [??] operators does not reject the second
 * operand if the first one is [null] in potentially constant expression.
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

class MyClass {
  final int a;
  const MyClass(int i1, Object i2) : a = (i1 ?? (i2 as int));
}

main() {
  const MyClass c1 = MyClass(null, 123);
  Expect.equals(123, c1.a);
}
