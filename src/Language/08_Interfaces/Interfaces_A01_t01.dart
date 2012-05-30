/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interfaceDefinition:
 * interface identifier typeParameters? superinterfaces? factorySpecification?
 * '{' (interfaceMemberDefinition)* '}'
 * ;
 * interfaceMemberDefinition:
 *   static final type? initializedIdentifierList ';' |
 *   functionSignature ';' |
 *   constantConstructorSignature ';' |
 *   namedConstructorSignature ';' |
 *   getterSignature ';' |
 *   setterSignature ';' |
 *   operatorSignature ';' |
 *   variableDeclaration ';'
 * ;
 * @description Checks that valid interface declarations don't produce a compile-time error
 * @author msyabro
 * @reviewer kaigorodov
 */

interface A default ClassA {
  static final x = 1;
  const A();

  get something();
  set something(something);
}

interface B extends A default ClassB{
  B(a, b, [c = 0]);
  B.C();

  operator~();
  operator[](index);
}

interface C extends A, B {
  var variable1;
  final variable2;
  int variable3;
}

interface D<T, S> {
  f(x);
  g([y]);
  h();
  i([x = 1]);
}

interface E<T extends num> extends D<B, T> {

}

class ClassA implements A {
  factory A() {}
  ClassA() {}
}

class ClassB implements B {
  factory B(a, b, [c = 0]) {}
  factory B.c() {}
  ClassB(a, b, c) {}
  ClassB.C() {}
}

class Class implements C, E {
  Class() {}
}

main() {
  new A();
  new B(1, 2, 3);
  new Class();
}
