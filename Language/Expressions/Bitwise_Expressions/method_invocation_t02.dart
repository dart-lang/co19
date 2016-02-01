/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A bitwise expression of the form e1 op e2
 * is equivalent to the method invocation e1.op(e2).
 * @description Checks that an expression of the form e1 ^ e2
 * is equivalent to the method invocation e1.operator^(e2).
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

class A {
  var val;
  operator ^(var arg) {
    val = arg;
  }
}

main() {
  A a = new A();
  int arg = 123;
  a ^ arg;
  Expect.isTrue(a.val == arg);
}
