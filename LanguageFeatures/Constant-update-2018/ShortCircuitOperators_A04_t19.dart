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
 * @description Checks that conditional operator [?]/[:] works correctly if all
 * the operands are correct constant expressions.
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

const ok_str = "OK";
const wrong_str = "wrong";

class MyClass1 {
  final String res;
  const MyClass1() : res = (true ? "true" : "false");
}

class MyClass2 {
  final String res;
  const MyClass2() : res = (false ? wrong_str : ok_str);
}

main() {
  const MyClass1 c1 = MyClass1();
  Expect.equals("true", c1.res);

  const MyClass2 c2 = MyClass2();
  Expect.equals("OK", c2.res);

}
