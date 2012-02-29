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
 * methodSignature:
 *   factoryConstructorSignature
 *   | static? functionSignature
 *   | getterSignature
 *   | setterSignature
 *   | operatorSignature
 *   | constructorSignature initializers?
 * ;
 * @description Checks that various class member method definitions that are valid according to
 * this syntax do not cause any errors and such class can be instantiated. 
 * @author msyabro
 * @reviewer rodionov
 */

interface I default A {
  I();
}

class A {
  factory I() {}
  A() {}
  A.B() {}
  A.C(): _x = 1 {}

  static f() {}
  get x() {}
  set x(var v) {}
  operator==(A other) {}

  var _x;
}

class B {
  B(): y = 1 {}
  var y;
}

main() {
  A a = new A.B();
  B b = new B();
  I i = new I();
}