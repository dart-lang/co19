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
 * @description Checks that the returned type of this implicit getter is the same as the
 * static field's type, by attempting to assign the result of its invocation to a variable
 * of incompatible type. Static warning expected.
 * @author pagolubev
 * @static-warning
 * @reviewer msyabro
 * @reviewer rodionov
 */

class A {
  static final int a = 2;
}

main() {
  try {
    bool a = A.a;
  } catch(TypeError e) {}
}
