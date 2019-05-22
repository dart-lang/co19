/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *    typeParameter ::= metadata identifier (extends typeNotVoid)?
 *    typeParameters ::= ‘<’ typeParameter (‘,’ typeParameter)* ‘>’
 * A type parameter [T] may be suffixed with an [extends] clause that specifies
 * the upper bound for [T].
 * @description Checks that [extends] clause specifies upper bound for the class
 * type parameter
 * @author iarkh@unipro.ru
 */

class A {} 
class B extends A {}
class C extends B {}

class C1<T extends A> {}
class C2<T extends B> {}
class C3<T extends C> {}

main() {
  C1 c11 = C1();
  C1 c12 = C1<A>();
  C1 c13 = C1<B>();
  C1 c14 = C1<C>();

  C2 c21 = C2();
  C2 c22 = C2<A>(); //# 01: compile-time error
  C2 c23 = C2<B>();
  C2 c24 = C2<C>();

  C3 c31 = C3();
  C3 c32 = C3<A>(); //# 02: compile-time error
  C3 c33 = C3<B>(); //# 03: compile-time error
  C3 c34 = C3<C>();
}
