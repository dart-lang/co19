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
 * @description Checks that if vg is a function, then it is called with the
 * evaluated argument list.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../../Utils/expect.dart';

class TestException {}

class S {
  var func;
}

class A extends S {
  test() {
    func = (exception) {throw exception;};
    try {
      super.func(new TestException());
      Expect.fail("TestException is expected");
    } on TestException catch (e) {}
  }
}

main() {
  new A().test();
}
