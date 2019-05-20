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
 * @description Statically checks that [extends] clause specifies upper bound
 * for the class type parameter
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A {} 
class B extends A {}
class C extends B {}

class D<T> {}

typedef Alias1<T extends A> = D<T>;
typedef Alias2<T extends B> = D<T>;
typedef Alias3<T extends C> = D<T>;

main() {
  D d11 = Alias1();
  D d12 = Alias1<A>();
  D d13 = Alias1<B>();
  D d14 = Alias1<C>();

  D d21 = Alias2();
  D d22 = Alias2<A>(); //# 01: compile-time error
  D d23 = Alias2<B>();
  D d24 = Alias2<C>();

  D d31 = Alias3();
  D d32 = Alias3<A>(); //# 02: compile-time error
  D d33 = Alias3<B>(); //# 03: compile-time error
  D d34 = Alias3<C>();
}
