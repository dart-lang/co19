/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static variable declaration of one of the forms static T v;,
 * static T v = e; or static final T v = e; always induces an implicit static
 * getter function (7.2) with signature static T get v() whose invocation
 * evaluates to the value stored in v.
 * @description Checks that one can indeed retrieve the value of a static variable declared
 * using either way, by invoking these getters.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 */

class A {
  static int a;
  static int b = 1;
  static final int c = 2;
}

main() {
  Expect.equals(null, A.a);
  Expect.equals(1, A.b);
  Expect.equals(2, A.c);
}
