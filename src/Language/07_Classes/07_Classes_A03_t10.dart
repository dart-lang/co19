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
 * @description Checks that various class member method definitions withat are valid according to
 * this syntax do not cause any errors and such class can be instantiated. 
 * @author msyabro
 * @reviewer rodionov
 */

interface I default A {
  I();
}

class A {
  @A(1) factory I() {}
  @A A() {}
  @A(1) A(int a) {}
  @A A.B() {}
  @A(1) A.C(): _x = 1 {}

  @A static f() {}
  @A(1) get x() {}
  @A set x(var v) {}
  @A(1) operator==(A other) {}

  @A var _x;
}

class B {
  @A(1) B(): y = 1 {}
  @A var y;
}

main() {
  A a = new A.B();
  B b = new B();
  I i = new I();
}
