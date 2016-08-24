/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static methods are functions, other than getters or setters,
 * whose declarations are immediately contained within a class declaration
 * and that are declared static.
 * The static methods of a class C are those static methods declared by C.
 * @description Checks that static methods cannot access instance fields.
 * @compile-error
 * @author vasya
 */

class C {
  static foo() { return bar; }

  var bar;
}

main() {
  try {
    C.foo();
  } catch (e) {}
}
