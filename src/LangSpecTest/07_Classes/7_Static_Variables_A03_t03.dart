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
 * @description Checks that the formal parameter type of this implicit setter
 * is correct and the same as the type of the static variable by attempting to
 * pass a value of incompatible type (String) to it. Static warning expected.
 * @static-warning
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 */

class A {
  static int a = 1;
}

main() {
  try {
    A.a = '1';
  } catch(TypeError e) {}
}
