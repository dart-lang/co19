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
 * @description Checks that names are properly resolved in a nested scopes.
 * @author pagolubev
 * @reviewer msyabro
 */

class A {
  A() : x = 'classA' {}
  var x;
}

class B extends A {
  B() : super() {}
}

class C extends B {
  C() : super() {}

  void foo() {
    {
      var x = 'foo1';
      {
        var x = 'foo2';
        {
          Expect.isTrue(x == 'foo2');  
          x = 'foo3';
        }
        Expect.isTrue(x == 'foo3'); 
      }
      Expect.isTrue(x == 'foo1');
    }
    Expect.isTrue(x == 'classA');
  }
}


void main() {
  C c = new C();
  c.foo();
}
