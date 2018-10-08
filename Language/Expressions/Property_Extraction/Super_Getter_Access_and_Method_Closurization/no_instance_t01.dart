/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let Sstatic be the superclass of the immediately enclosing class.
 * It is a static type warning if Sstatic does not have an accessible instance
 * method or getter named m.
 * @description Check that It is a compile error if S does not have an
 * accessible instance method or getter named m.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class A {
}

class C extends A {
  int get m => 2;

  void test() {
    var i = super.m;
  }
}

main() {
  C c = new C();
  c.test();
}
