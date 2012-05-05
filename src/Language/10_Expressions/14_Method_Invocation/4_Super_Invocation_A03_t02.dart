/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the method lookup has failed, then let g be the result of looking up getter
 * m in S with respect to L. If the getter lookup succeeded, let vg be the value
 * of the getter invocation super.m. Then the value of i is the value of
 * the method invocation vg.call(a1, …, an, xn+1: an+1, …, xn+k: an+k).
 * @description Checks that NoSuchMethodException is thrown if getter is not a function
 * and getter is declared implicitly.
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview Issue 1244
 */

class S {
  var func;
}

class A extends S {
  test() {
    try {
      super.func();
      Expect.fail("NoSuchMethodException is expected");
    } catch(NoSuchMethodException e) {}
  }
}

main() {
  new A().test();
}