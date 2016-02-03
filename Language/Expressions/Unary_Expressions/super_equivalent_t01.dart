/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form op super is equivalent to the method
 * invocation super.op().
 * @description Checks that an expression of the form ~ super is equivalent to
 * the method invocation super.operator~().
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class TestException {}

class S {
  operator ~() {
    throw new TestException();
  }
}

class A extends S{
  test() {
    try {
      ~super;
      Expect.fail("Operator ~ was not called");
    } on TestException catch (e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
