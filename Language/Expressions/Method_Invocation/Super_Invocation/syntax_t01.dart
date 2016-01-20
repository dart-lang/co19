/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A super method invocation i has the form
 * super.m(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
 * @description Checks that method invocations, which matching the production,
 * don't cause compile-time errors.
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {
  f1() {}
  f2(p1, p2, p3) {}
  f3([name1, name2]) {}
  f4(p1, [name]) {}
  f5(p1, p2, {name1, name2}) {}
  f6(p1, p2, p3, p4, {name1, name2}) {}
}

class A extends S {
  test() {
    super.f1();

    super.f2(1 * 1, 1 / 1, 1 < 1);
    super.f2(new Object(), true, false);

    super.f3();
    super.f3(1);
    super.f3(1, "");
    super.f4(1);
    super.f4(1, 1);
    super.f5(null, null);
    super.f5(null, null, name2: null);
    super.f5(null, null, name1: null, name2: null);
    super.f6(() {}, () {return true;}, {}, [], name1: (x) => x + 1,
        name2: (y) => (z) => z - y);
  }
}

main() {
  new A().test();
}
