/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static variable declaration of one of the forms static var v;,
 * static var v = e; or static final v = e; always induces an implicit static
 * getter function with signature static get v() whose invocation evaluates to
 * the value stored in v.
 * @description Checks that one can indeed retrieve the value of a static variable
 * declared using either way, by invoking these getters.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 */

class A {
  static var a;
  static var b = 1;
  static final c = 2;
}

main() {
  Expect.equals(null, A.a);
  Expect.equals(1, A.b);
  Expect.equals(2, A.c);
}
