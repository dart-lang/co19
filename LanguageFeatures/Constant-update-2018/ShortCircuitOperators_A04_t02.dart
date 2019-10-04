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
 * @description Checks that conditional operator [?]/[:] rejects the second
 * operand if condition is [true] for constant expressions
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

class MyClass1 {
  final bool res;
  const MyClass1() : res = (true ? true : (null as String).length);
}

class MyClass2 {
  final int res;
  const MyClass2() : res = (true ? 125 : (null as String).length > 0);
}

class MyClass3 {
  final int res;
  const MyClass3(val) : res = (true ? 125 : (val as int));
}

main() {
  const MyClass1 c1 = MyClass1();
  Expect.isTrue(c1.res);

  const MyClass2 c2 = MyClass2();
  Expect.equals(125, c2.res);

  const MyClass3 c3 = MyClass3(123);
  Expect.equals(125, c2.res);

  const MyClass3 c4 = MyClass3("12345");
  Expect.equals(125, c2.res);
}
