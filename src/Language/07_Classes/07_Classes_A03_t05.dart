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
 *   factoryConstructorSignature
 *   | static? functionSignature
 *   | getterSignature
 *   | setterSignature
 *   | operatorSignature
 *   | constructorSignature initializers?
 * ;
 * @description Checks that there is no compile-time error if a setter
 * method definition does not include a body. This make the class abstract, and 
 * AbstractClassInstantiationError is thrown when instantiation attempted.
 * @author msyabro
 */

class A {
  set val(var v);
  var _val;
}

main() {
  try {
    A a = new A();
  } on AbstractClassInstantiationError catch (e) {}
}
