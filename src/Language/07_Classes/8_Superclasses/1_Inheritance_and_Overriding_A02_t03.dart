/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a class declared in library L, with superclass S and let
 * C declare an instance member m, and assume S declares an instance member m'
 * with the same name as m. Then m overrides m' iff m' is accessible (3.2) to L
 * and one of the following holds:
 * - m is an instance method.
 * - m is a getter and m' is a getter or a method.
 * - m is a setter and m' is a setter or a method.
 * @description Checks that a setter can override another setter.
 * @note Ch. 7.3 says that a setter cannot override a method so not testing that.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 */

class A {
  var a = 2; // implicit setter
}

class B extends A {
  set a(x) { super.a *= x; }
}

main() {
  A a = new B();
  a.a = 2;
  Expect.equals(4 , a.a);
}
