/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The new expression invokes a constructor.
 * newExpression:
 *   new type ('.' identifier)? arguments
 * ;
 * @description Checks that various valid new expressions don't
 * produce compile-time errors.
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  A() {}
  A.anotherConstructor(p1, p2) {}
}

class B {
  B(p1) {}
  B.b({p1, p2}) {}
}

class C {
  C.$_$(p1, p2, [p3 = 1]) {}
}

class D {
  const D();
}

main() {
  new A();
  new A.anotherConstructor(1, 2);

  new B(new A());
  new B.b(p2: "", p1: null);

  new C.$_$(new A() == new B(1), ()=>1);

  new D();
}
