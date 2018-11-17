/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Finally, the conditional [?]/[:] operator only evaluates one of
 * its branches, depending on whether the condition expression evaluates to
 * [true] or [false]. The other branch must also be a potenatially constant
 * expression.
 * @description Checks that operator [??] operators rejects the second operand
 * if the first one is not [null] in potentially constant expression.
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

class MyClass {
  final String a;
  const MyClass(Object i1, Object i2) : a = (i1 ?? (i2 as String).length);
}

main() {
  const MyClass c1 = MyClass("testme", 123);
  Expect.equals("testme", c1.a);

  const MyClass c2 = MyClass("111", "222");
  Expect.equals("111", c2.a);
}
