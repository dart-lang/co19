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
 * methodSignature:
 *   constructorSignature initializers? |
 *   factoryConstructorSignature |
 *   static? functionSignature |
 *   static? getterSignature |
 *   static? setterSignature |
 *   operatorSignature
 * ;
 * @description Checks that various class member method definitions wich are 
 * valid according to this syntax do not cause any errors and such class can 
 * be instantiated. 
 * @author msyabro
 */

class A {
  @B(1) factory A.f() {}
  @A() const A():_x = 0;
  @A() A.B():_x = 2;
  @B(1) A.C(): _x = 1 {}

  @A() static fun() {}
  @B(1) get x {}
  @A() set x(var v) {}
  @B(1) operator ==(dynamic other) {}

  @A() final _x;
}

class B {
  @B(1) const B(this.y);
  @A() final y;
}

main() {
  A a = new A();
  A ab = new A.B();
  A i = new A.f();
  B b = new B(2);
}
