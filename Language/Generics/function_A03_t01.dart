/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic function declaration introduces a generic function into
 * the enclosing scope. Consider a function invocation expression of the form
 * [f<T1, . . . , Tl>(...)], where the static type of [f] is a generic function
 * type with formal type parameters [X1 extends B1], . . . , [Xm extends Bm].
 * ...
 * It is a compile-time error if there exists a [j] such that [Tj] is not a
 * subtype of [T1/X1, . . . , Tm/Xm]Bj.
 * @description checks that error appears if some parameter type is incorrect.
 * @author iarkh@unipro.ru
 */

class A {}
class B extends A {}
class C extends B {}
class D {}

void testme1<T>() {}
void testme2<T extends A>() {}
void testme3<T extends B>() {}
void testme4<T extends C>() {}
void testme5<T extends D>() {}


main() {
  testme1<A>();
  testme1<B>();
  testme1<C>();
  testme1<D>();

  testme2<A>();
  testme2<B>();
  testme2<C>();
  testme2<D>(); //# 01: compile-time error

  testme3<A>(); //# 02: compile-time error
  testme3<B>();
  testme3<C>();
  testme3<D>(); //# 03: compile-time error

  testme4<A>(); //# 04: compile-time error
  testme4<B>(); //# 05: compile-time error
  testme4<C>();
  testme4<D>(); //# 06: compile-time error

  testme5<A>(); //# 07: compile-time error
  testme5<B>(); //# 08: compile-time error
  testme5<C>(); //# 09: compile-time error
  testme5<D>();
}
