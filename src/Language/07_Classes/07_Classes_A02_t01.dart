/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * abstract? class identifier typeParameters? superclass? interfaces?
 *   '{' classMemberDefinition* '}'
* ;
 * classMemberDefinition:
 *   declaration ';' |
 *   methodSignature functionBody
 * ;
 * declaration:
 *   constantConstructorSignature (redirection | initializers)?
 *   | constructorSignature (redirection | initializers)?
 *   | abstract getterSignature
 *   | abstract setterSignature
 *   | abstract operatorSignature
 *   | abstract functionSignature
 *   | static final type? staticFinalDeclarationList
 *   | static? initializedVariableDeclaration
 * ;
 * staticFinalDeclarationList:
 *   staticFinalDeclaration (', ' staticFinalDeclaration)*
 * ;
 * staticFinalDeclaration:
 *   identifier '=' expression
 * ;
 * @description Checks that various class member declarations that are valid according to
 * this syntax do not cause any errors and such class can be instantiated. 
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  const A(): this.anotherConstructor();
  const A.anotherConstructor();
  static final x = 1, y = 2;
  static final int z = 3;
}

class B {
  const B();
  B.anotherConstructor(): this.oneMoreConstructor();
  B.oneMoreConstructor() {}
  static final initialized = 1;
}

class C {
  const C(): x = 1;
  final x;
}

class D {
  D();
  D.name() : a = 2;
  var x, y = 2, z;
  int a = 1;
  static int typed;
}

class E {
  E(): this.D();
  E.D();
  static var nonInitialized;
}

class F {
  F(): x = 1, y = 2;
  var x, y;
}

class Abstract {
  abstract func();
  abstract get val();
  abstract set val(var v);
  abstract operator==(Abstract other);

  var _val;
}

main() {
  A a = const A();
  B b = new B();
  C c = const C();
  D d = new D();
  E e = new E();
  F f = new F();
}
