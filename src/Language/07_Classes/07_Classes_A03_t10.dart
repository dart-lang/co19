/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * metadata abstract? class identifier typeParameters? superclass? interfaces?
 *   ‘{’ classMemberDefinition* ‘}’
 * ;
 * classMemberDefinition:
 *   metadata declaration ‘;’ |
 *   metadata methodSignature functionBody
 * ;
 * methodSignature:
 *   factoryConstructorSignature |
 *   static? functionSignature |
 *   getterSignature |
 *   setterSignature |
 *   operatorSignature |
 *   constructorSignature initializers?
 * ;
 * @description Checks that various class member method definitions wich are valid according to
 * this syntax do not cause any errors and such class can be instantiated. 
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  @B(1) factory A.f() {}
  @A A() {}
  @A A.B() {}
  @B(1) A.C(): _x = 1 {}

  @A static fun() {}
  @B(1) get x() {}
  @A set x(var v) {}
  @B(1) operator==(A other) {}

  @A var _x;
}

class B {
  @B(1) B(this.y) {}
  @A var y;
}

main() {
  A a = new A();
  A ab = new A.B();
  A i = new A.f();
  B b = new B(2);
}
