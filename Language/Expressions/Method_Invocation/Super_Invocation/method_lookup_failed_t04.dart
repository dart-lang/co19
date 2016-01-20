/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the method lookup has failed, then let g be the result of
 * looking up getter m in Sdynamic with respect to L. If the getter lookup
 * succeeded, let vg be the value of the getter invocation super.m. Then the
 * value of i is the result of invoking the static method Function.apply()
 * with arguments v.g, [o1, ..., on], {xn+1:on+1, ..., xn+k:on+k}.
 * @description Checks that the result of super method invocation is the result
 * of calling Function.apply on v.g, [o1, ..., on], {xn+1:on+1, ..., xn+k:on+k}
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../../Utils/expect.dart';

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
