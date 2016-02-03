/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form op e is equivalent to the method
 * invocation e.op().
 * @description Checks that an expression of the form ~ e is equivalent to the
 * method invocation e.operator~().
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class TestException {}

class A {
  operator ~() {
    throw new TestException();
  }
}

main() {
  A a = new A();
  try {
    ~a;
    Expect.fail("Operator ~ was not called");
  } on TestException catch (e) {}
}
