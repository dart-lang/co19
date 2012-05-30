/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A super method invocation has the form
 * super.m(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
 * @description Checks that argument list should not end with comma.
 * @compile-error
 * @reviewer kaigorodov
 * @author msyabro
 */

class S {
  f(p1, p2, p3) {}
}

class A extends S {
  test() {
    try {
      super.f(1, 2, 3, );
    } catch(var e) {}
  }
}

main() {
  new A().test();
}