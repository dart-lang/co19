/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a setter m1 overrides a setter
 * or method m2 and the type of m1 is not a subtype of the type of m2.
 * @description Checks that there are no warnings when type of m1 is in fact
 * a subtype of type of m2
 * @static-clean
 * @author ilya
 * @reviewer
 */

class Super {}
class Sub extends Super {}

class A {
  int      induced_setter1;
  Super    induced_setter2;
  Super    induced_setter3;
  Sub      induced_setter4;

  void set declared_setter1(int value) {}
  void set declared_setter2(Super value) {}
  void set declared_setter3(Super value) {}
  void set declared_setter4(Sub value) {}
}

class C extends A {
  dynamic  induced_setter1;
  Super    induced_setter2;
  Sub      induced_setter3;
  Super    induced_setter4;

  void set declared_setter1(dynamic value) {}
  void set declared_setter2(Super value) {}
  void set declared_setter3(Sub value) {}
  void set declared_setter4(Super value) {}
}

main() {
  new A();
  new C();
}

