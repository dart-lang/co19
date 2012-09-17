/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a class declared in library L, with superclass S and let
 * C declare an instance member m, and assume S declares an instance member 'm'
 * with the same name as m. Then m overrides m iﬀ m is accessible (3.2) to L,
 * m has the same name as m and neither m nor m are ﬁelds.
 * Fields never override each other. The getters and setters induced by ﬁelds do.
 * @description Checks that a getter can override another getter.
 * @note Ch. 7.2 says that a getter cannot override a method so not testing that.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 */

class A {
  get foo {return "foo";}
}

class B extends A {
  get foo {return "bar";}
}

main() {
  B b = new B();
  Expect.equals("bar", b.foo);
}
