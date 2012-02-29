/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the method lookup has failed, then let g be the result of looking up getter
 * m in S with respect to L. If the getter lookup succeeded, let vg be the value
 * of the getter invocation super.m. If vg is a function then it is called with the
 * evaluated argument list. The value of i is the value returned after vg is executed.
 * If vg is not a function then an ObjectNotAClosure is thrown.
 * @description Checks that ObjectNotClosureException is thrown if getter is not a function
 * and getter is declared implicitly.
 * @author msyabro
 * @needsreview Issue 1244
 */

class S {
  var func;
}

class A extends S {
  test() {
    try {
      super.func();
      Expect.fail("ObjectNotClosureException is expected");
    } catch(ObjectNotClosureException e) {}
  }
}

main() {
  new A().test();
}