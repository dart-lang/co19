/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An assignable expression of the form super[e2] is equivalent
 * to the method invocation super.[](e2).
 * @description Checks that an assignable expression of the form super[e2] is
 * equivalent to the method invocation super.[](e2).
 * @author msyabro
 */
import '../../../Utils/expect.dart';

class S {
  operator [](var ind) {
    return ind * 2;
  }
}

class A extends S {
  test() {
    Expect.equals(super[0], 0);
    Expect.equals(super[1], 2);
    Expect.equals(super[-1], -2);
    Expect.equals(super[1000], 2000);
  }
}

main() {
  A a = new A();
  a.test();
}
