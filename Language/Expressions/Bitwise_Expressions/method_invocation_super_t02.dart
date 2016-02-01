/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A bitwise expression of the form super op e2 is
 * equivalent to the method invocation super.op(e2).
 * @description Checks that an expression of the form super ^ e2
 * is equivalent to the method invocation super.operator^(e2).
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

class S {
  var val;
  operator ^(var arg) {
    val = arg;
  }
}

class A extends S {
  test(var arg) {
    super ^ arg;
  }
}

main() {
  A a = new A();
  int arg = 123;
  a.test(arg);
  Expect.isTrue(a.val == arg);
}
