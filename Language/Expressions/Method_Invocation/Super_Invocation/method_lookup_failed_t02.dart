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
 * @description Checks that it is a compile error if an implicit getter
 * is invoked and its value is neither null, nor function.
 * @compile-error
 * @author msyabro
 * @author sgrekhov@unipro.ru
 */

class S {
  int func = 1;
}

class A extends S {
  test() {
    super.func();
  }
}

main() {
  new A().test();
}
