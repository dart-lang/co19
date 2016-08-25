/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 *   metadata abstract? class identifier typeParameters? (superclass mixins?)? 
 * interfaces? ‘{’ (metadata classMemberDefinition)* ‘}’ |
 *   metadata abstract? class mixinApplicationClass
 * ;
 * metadata:
 *   (’@’ qualified (. identifier)? (arguments)?)*
 * ;
 * @description Checks that various class definitions that are valid according 
 * to this syntax and have metadata do not cause any errors and can be 
 * instantiated.
 * @author kaigorodov
 */

@A() abstract class I {}
@B() abstract class J {}
@A() abstract class IT <T> {}

@B.fromInt(1) class A {
  const A();
}

@B.fromInt(1) class B extends A {
  const B();
  const B.fromInt(int a);
}

@B.fromInt(1) class C extends B implements I {}
@A() class D implements I, J {}
@B.fromInt(1) class E extends D implements I, J {}

@B.fromInt(1) class F<T> {}
@A() class G<S, T> extends F<T> {}
@B.fromInt(1) class H<T> implements I {}
@A() class K extends G<int, int> implements I {}
@B.fromInt(1) class L<T extends A, S extends B> implements IT<T> {}

@A() abstract class M {}
@B.fromInt(1) abstract class N<T, U> extends A {}
@A() abstract class O extends N<int, int> implements I {}

main() {
  A a = new A();
  B b = new B.fromInt(2);
  C c = new C();
  D d = new D();
  E e = new E();
  F f = new F();
  G g = new G();
  H h = new H();
  K k = new K();
  L l = new L();
}
