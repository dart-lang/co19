/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class C inherits any accessible instance members of its superclass that
 * are not overridden by members declared in C. A class may override instance members
 * that would otherwise have been inherited from its superclass.
 * @description Checks that a subclass inherits the instance members of its superclass(es).
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 */

class A {
  int val;
}

class B extends A {
  foo() {
    ++val;
  }
}

class C extends B {}

main() {
  C c = new C();
  c.val = 5;
  Expect.equals(5, c.val);
  c.foo();
  Expect.equals(6, c.val);
}
