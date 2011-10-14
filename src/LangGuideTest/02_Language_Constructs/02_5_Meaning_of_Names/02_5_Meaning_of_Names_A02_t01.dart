/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names are resolved by considering each enclosing lexical scope starting with
 * the innermost and ending with the library scope. If the name is still unresolved,
 * the superclass chain is consulted. If the name is not found in the superclass chain either,
 * the name is unbound.
 * @description Checks that name is resolved as a field of the super class if it is not
 * declared in the lexical scope.
 * @author msyabro
 * @reviewer pagolubev
 */

class A {
  var i;
  A(): i=1 {}
}

class B extends A {
  foo() {
    Expect.isTrue(i == 1);
    i = 3;
    Expect.isTrue(super.i == 3);
  }
  B(): super() {}
}


main() {
  B b = new B();
  b.foo();
}
