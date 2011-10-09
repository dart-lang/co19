/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Within the same class static methods may be called without prefixing (lexical scoping).
 * @description Checks calling static method without prefixing from subclass static method.
 * @author pagolubev
 * @reviewer iefremov
 * @compile-error
 */

class A {
  static int foo() { return 1; }
}

class B extends A {
  static int bar() { return foo(); }
}


void main() {
  Expect.isTrue(B.bar() == 1);
}
