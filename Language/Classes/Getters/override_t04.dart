/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion    It is a static warning if a getter m1 overrides (7.9.1) a getter m2 and the
 * type of m1 is not a subtype of the type of m2 .
 * @description Checks that there are no warnings when type of m1 is in fact
 * a subtype of type of m2
 * @static-clean
 * @author ilya
 * @reviewer
 */

class Super {}
class Sub extends Super {}

class A {
  int      induced_getter1;
  Super    induced_getter2;
  Super    induced_getter3;
  Sub      induced_getter4;

  int      get declared_getter1 {}
  Super    get declared_getter2 {}
  Super    get declared_getter3 {}
  Sub      get declared_getter4 {}
}

class C extends A {
  dynamic  induced_getter1;
  Super    induced_getter2;
  Sub      induced_getter3;
  Super    induced_getter4;
  
  dynamic  get declared_getter1 {}
  Super    get declared_getter2 {}
  Sub      get declared_getter3 {}
  Super    get declared_getter4 {}
}

main() {
  new A();
  new C();
}

