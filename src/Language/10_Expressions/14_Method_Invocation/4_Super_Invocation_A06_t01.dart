/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if S does not have an accessible
 * instance member named m.
 * @description Checks that it is a static type warning if S does not have an instance member named m.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {}

class A extends S {
  test() {
    try {
      super.m();
      Expect.fail("NoSuchMethodError is expected");
    } on NoSuchMethodError catch(e) {}
  }
}

main() {
  new A().test();
}
