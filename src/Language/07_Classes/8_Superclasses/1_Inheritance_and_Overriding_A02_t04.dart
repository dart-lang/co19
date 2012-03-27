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
 * @description Checks that m does not override m' if m' is not accessible.
 * @author iefremov
 */

#import("1_Inheritance_and_Overriding_A02_t04_lib.dart");

class B extends A {
  _foo() { return 'B'; }
}

main() {
  A a = new B();
  try {
    a.foo();
    Expect.fail("NoSuchMethodException expected! A private method can not be overriden");
  } catch(NoSuchMethodException ok) {}
}
