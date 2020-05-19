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
 * @description Checks that [extends] clause specifies upper bound for the
 * [typedef] type parameter
 * @author iarkh@unipro.ru
 */

class A {} 
class B extends A {}
class C extends B {}

class D<T> {}

typedef Alias1<T extends A> = void Function(T);
typedef Alias2<T extends B> = void Function(T);
typedef Alias3<T extends C> = void Function(T);

main() {
  Alias1 a1;
  Alias1<A> a2;
  Alias1<B> a3;
  Alias1<C> a4;

  Alias2 a5;
  Alias2<A> a6;  //# 01: compile-time error
  Alias2<B> a7;
  Alias2<C> a8;

  Alias3 a9;
  Alias3<A> a10; //# 02: compile-time error
  Alias3<B> a11; //# 03: compile-time error
  Alias3<C> a12;
}
