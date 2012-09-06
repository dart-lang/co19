/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * metadata abstract? class identifier typeParameters? superclass? interfaces?
 *   '{' classMemberDefinition* '}'
 * ;
 * classMemberDefinition:
 *   metadata declaration ';' |
 *   metadata methodSignature functionBody
 * ;
 * declaration:
 *   constantConstructorSignature (redirection | initializers)? |
 *   constructorSignature (redirection | initializers)? |
 *   external constantConstructorSignature |
 *   external constructorSignature |
 *   external? getterSignature |
 *   external? setterSignature |
 *   external? operatorSignature |
 *   (external static?)? functionSignature |
 *   static (final | const) type? staticFinalDeclarationList |
 *   const type? staticFinalDeclarationList |
 *   final type? initializedIdentifierList |
 *   static? (var | type?) initializedIdentifierList
 * ;
 * staticFinalDeclarationList:
 *   staticFinalDeclaration (', ' staticFinalDeclaration)*
 * ;
 * staticFinalDeclaration:
 *   identifier '=' expression
 * ;
 * @description Checks that various class member declarations with metadata that are valid according to
 * this syntax do not cause any errors and such class can be instantiated. 
 * @author msyabro
 * @author kaigorodov
 */

class A {
  @A(1)   const A(): this.anotherConstructor();
  @A   const A.anotherConstructor();
  @A(1)   A(int a){}
  @A static final x = 1, y = 2;
  @A(1) static final int z = 3;
  @A static const x1 = 1, y1 = 2;
  @A(1) static const int z1 = 3;
}

class B {
  @A(1) const B();
  @A B.anotherConstructor(): this.oneMoreConstructor();
  @A(1) B.oneMoreConstructor() {}
  @A static var initialized = 1;
  @A(1) static int initialized2 = 2;
}

class C {
  @A(1) const C(): x = 1;
  @A final x;
  @A(1) final int x1;
}

class D {
  @A(1) D();
  @A D.name() : a = 2;
  @A(1) var x, y = 2, z;
  @A int a = 1;
  @A(1) static int typed;
  @A static untyped;
}

class E {
  @A(1) E(): this.D();
  @A E.D();
  @A(1) static var nonInitialized;
}

class F {
  @A(1) F(): x = 1, y = 2;
  @A var x, y;
  @A(1) int x1, y1;
  @A x2, y3;
}

class Abstract {
  @A(1) func();
  @A funcWithParams(p1, p2);
  @A(1) funcWithOptionalParams([p1 = 1, p2 = 2]);
  @A get val();
  @A(1) set val(var v);
  @A operator==(Abstract other);

  @A(1) var _val;
}

main() {
  A a = const A();
  B b = new B();
  C c = const C();
  D d = new D();
  E e = new E();
  F f = new F();
}
