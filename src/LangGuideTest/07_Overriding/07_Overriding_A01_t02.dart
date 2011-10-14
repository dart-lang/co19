/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function overrides a function in a superclass if the function in the superclass has the same name.
 * @description Checks that the function overrides a function with the same name
 * in the superclass.
 * @author msyabro
 * @reviewer pagolubev
 */
 
class A {
  A() {}
  int func() {
    return 1;
  }
}
 
class B extends A{
  B(): super() {}
  int func() {
    return 2;
  }
}


main() {
  A a = new B();
  int x = a.func();
  Expect.isTrue(x == 2);
}
