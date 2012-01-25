/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function may have a return type.
 * The return type is either a valid type or void.
 * @description Checks that the return type can be a valid type or void.
 * @author pagolubev
 * @reviewer iefremov
 */


class A {
  A() {}

  int f1(int x) { return x; }
  
  void f2() {}

  static int f3() { return 3;  }

  static void f4(int x) {}

}


main() {
  int f2() { return 2; }
  Expect.isTrue(2 == f2());

  void f1() {}
  f1();

  A a = new A();
  Expect.isTrue(a.f1(1) == 1);
  a.f2();

  Expect.isTrue(A.f3() == 3);
  A.f4(3);
}
