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
 * @description Checks that various class member declarations that are valid
 * according to this syntax do not cause any errors and such class can be
 * instantiated.
 * @author kaigorodov
 * @reviewer rodionov
 */

class A {
  const A(): this.anotherConstructor();
  const A.anotherConstructor();
  static final x = 1, y = 2;
  static final int z = 3;
  static const x1 = 1, y1 = 2;
  static const int z1 = 3;
}

class B {
  const B();
  B.anotherConstructor(): this.oneMoreConstructor();
  B.oneMoreConstructor() {}
  static var initialized = 1;
  static int initialized2 = 2;
}

class C {
  const C(): x = 1;
  final x;
  final int x1=-1;
}

class D {
  D();
  D.name() : a = 2;
  var x, y = 2, z;
  int a = 1;
  static int typed;
  static var untyped;
}

class E {
  E(): this.D();
  E.D();
  static var nonInitialized;
}

class F {
  F(): x = 1, y = 2;
  var x, y;
  int x1, y1;
  var x2=2, y3=2;
}

abstract class Abstract {
  func();
  funcWithParams(p1, p2);
  funcWithOptionalParams([p1 = 1, p2 = 2]);
  funcWithOptionalParams2({p1: 1, p2: 2});
  get val;
  set val(var v);
  operator ==(dynamic other);

  var _val;
}

class Concrete extends Abstract {
  func() {}
  funcWithParams(p1, p2) {}
  funcWithOptionalParams([p1 = 1, p2 = 2]) {}
  funcWithOptionalParams2({p1: 1, p2: 2}) {}
  get val => _val;
  set val(var v) {_val = v;}
  operator ==(dynamic other) {return identical(this, other);}
}

main() {
  A a = const A();
  B b = new B();
  C c = const C();
  D d = new D();
  E e = new E();
  F f = new F();
  Abstract abst = new Concrete();
}
