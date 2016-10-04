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
 */

class Super {}
class Sub extends Super {}

class A {
  void set setter1(int value) {}
  void set setter2(Super value) {}
  void set setter3(Sub value) {}
  void set setter4(Sub value) {}
}

class C extends A {
  void set setter1(num value) {}
  void set setter2(Super value) {}
  void set setter3(dynamic value) {}
  void set setter4(Super value) {}
}

main() {
  new A();
  new C();
}
