/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant object expression invokes a constant constructor.
 * constObjectExpression:
 *   const type ('.' identifier)? arguments
 * ;
 * @description Checks that various valid constant object expressions don't
 * produce compile-time errors.
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  const A();
  const A.anotherConstructor(p1, p2);
}

class B {
  const B(p1);
  const B.b({p1, p2});
}

class C {
  const C._1(p1, p2, [p3 = 1]);
}

main() {
  const A();
  const A.anotherConstructor(1, 2);

  const B(const A());
  const B.b(p2: "", p1: null);
  const B.b(p2: "p2");

  const C._1(const [], const {});
}
