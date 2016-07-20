/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A super method invocation i has the form
 * super.m(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
 * @description Checks that arguments must be separated with comma.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {
  f(p1, p2) {}
}

class A extends S {
  test() {
    try {
      super.f(new Object() new Object());
    } catch (e) {}
  }
}

main() {
  new A().test();
}
