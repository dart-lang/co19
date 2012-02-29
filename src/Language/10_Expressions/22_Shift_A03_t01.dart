/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A shift expression of the form super op e2 is equivalent
 * to the method invocation super.op(e2).
 * @description Checks that an expressions of the form super << e2
 * is equivalent to the method invocation super.operator<<(e2).
 * @author kaigorodov
 */

class S {
  int counter=0;
  operator<<(var v) {
    counter+=1;
    return true;
  }
  operator>>(var v) {
    counter+=2;
    return true;
  }
}

class A extends S {
  test() {
    super << 1;
    super >> 1;
    Expect.equals(3, counter);
  }
}

main() {
  A a = new A();
  a.test();
}
