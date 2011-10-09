/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Functions that do not explicitly return a value, implicitly return null.
 * This includes void functions.
 * @description Checks that various functions implicitly return null, not the last computed value.
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
  static int f1(int x) { 5 + 3; }

  static f2() {}

  static void f3() {}

  A() {}

  int f4(int x) { x*=2; }
  
  f5() {}

  void f6() {this;}
}


void main() {
  Expect.isTrue(A.f1(1) == null);
  Expect.isTrue(A.f2() == null);
  Expect.isTrue(A.f3() == null);

  A a = new A();
  Expect.isTrue(a.f4(1) == null);
  Expect.isTrue(a.f5() == null);
  Expect.isTrue(a.f6() == null);

  void g1() {int x = 5;}
  int g2() {g1();}
  
  Expect.isTrue(g1() == null);
  Expect.isTrue(g2() == null);
}
