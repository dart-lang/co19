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
 * @description Checks that it is a compile-time error if a static setter
 * method definition does not include a body.
 * @compile-error
 * @author msyabro
 */

class A {
  static set val(var v);
  static var _val;
}

main() {
  try {
    new A();
  } catch (e) {}
}
