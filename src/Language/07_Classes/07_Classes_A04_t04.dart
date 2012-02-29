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
 * @compile-error
 * @description Checks that a block statement can't be used in place of a class member definition.
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  {}
}

main() {
  try {
    A a = new A();
  } catch(var e) {}
}