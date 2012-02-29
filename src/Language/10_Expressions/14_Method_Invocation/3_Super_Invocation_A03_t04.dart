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
 * @description Checks that the value of an expression is the value returned after vg is executed.
 * @author msyabro
 * @needsreview Issue 1244
 */

f1() {
  return "v";
}

f2() {
  return false;
}

f3() {
  return 1;
}

f4() {
  return null;
}

class S {
  Function func;
}

class A extends S {
  test()  {
    super.func = f1;
    Expect.equals("v", super.func());

    super.func = f2;
    Expect.equals(false, super.func());

    super.func = f3;
    Expect.equals(1, super.func());
  
    super.func = f4;
    Expect.equals(null, super.func());
  }
}

main() {
  new A().test();
}