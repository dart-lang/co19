/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A non-final static variable declaration of the form static T v;
 * or the form static T v = e; always induces an implicit static setter
 * function (7.3) with signature static void set v(T x) whose execution sets
 * the value of v to the incoming argument x.
 * @description Checks that a value can be assigned to a static class variable
 * using this implicit setter.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 */

class A {
  static int a;
  static int b = 1;
}

main() {
  A.a = -2;
  Expect.equals(-2, A.a);

  A.b = 6;
  Expect.equals(6, A.b);
}
