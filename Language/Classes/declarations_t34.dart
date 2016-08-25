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
 * .  .  .
 * classMemberDefinition:
 *   declaration ';' |
 *   methodSignature functionBody
 * ;
 * .  .  .
 * declaration:
 *   constantConstructorSignature (redirection | initializers)? |
 *   constructorSignature (redirection | initializers)? |
 *   external constantConstructorSignature |
 *   external constructorSignature |
 *   (external static?)? getterSignature |
 *   (external static?)? setterSignature |
 *   external? operatorSignature |
 *   (external static?)? functionSignature |
 *   static (final | const) type? staticFinalDeclarationList |
 *   final type? initializedIdentifierList |
 *   static? (var | type) initializedIdentifierList
 * ;
 * staticFinalDeclarationList:
 *   staticFinalDeclaration (', ' staticFinalDeclaration)*
 * ;
 * staticFinalDeclaration:
 *   identifier '=' expression
 * ;
 * @description Checks that various class member declarations with metadata 
 * that are valid according to this syntax do not cause any errors and such 
 * class can be instantiated. 
 * @author kaigorodov
 */

class A {
  @B(1) const A(): this.anotherConstructor();
  @A() const A.anotherConstructor();
  @A() static final x = 1, y = 2;
  @B(1) static final int z = 3;
  @A() static const x1 = 1, y1 = 2;
  @B(1) static const int z1 = 3;
}

class B {
  @B(1) const B(int a);
  @A() B.anotherConstructor(): this.oneMoreConstructor();
  @B(1) B.oneMoreConstructor() {}
  @A() static var initialized = 1;
  @B(1) static int initialized2 = 2;
}

class C {
  @B(1) const C(): x = 1, x1 = 2;
  @A() final x;
  @B(1) final int x1;
}

class D {
  @B(1) D();
  @A() D.name() : a = 2;
  @B(1) var x, y = 2, z;
  @A() int a = 1;
  @B(1) static int typed;
  @A() static var untyped;
}

class E {
  @B(1) E(): this.D();
  @A() E.D();
  @B(1) static var nonInitialized;
}

class F {
  @B(1) F(): x = 1, y = 2;
  @A() var x, y;
  @B(1) int x1, y1;
}

abstract class Abstract {
  @B(1) func();
  @A() funcWithParams(p1, p2);
  @B(1) funcWithOptionalParams([p1 = 1, p2 = 2]);
  @B(1) funcWithNamedParams({p1: 1, p2: 2});
  @A() get val;
  @B(1) set val(var v);
  @A() operator ==(dynamic other);

  @B(1) var _val;
}

main() {
  A a = const A();
  B b = new B(2);
  C c = const C();
  D d = new D();
  E e = new E();
  F f = new F();
}
