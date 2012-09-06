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
 * declaration:
 *   constantConstructorSignature (redirection | initializers)? |
 *   constructorSignature (redirection | initializers)? |
 *   external constantConstructorSignature |
 *   external constructorSignature |
 *   external? getterSignature |
 *   external? setterSignature |
 *   external? operatorSignature |
 *   (external static?)? functionSignature |
 *   static (final | const) type? staticFinalDeclarationList |
 *   const type? staticFinalDeclarationList |
 *   final type? initializedIdentifierList |
 *   static? (var | type?) initializedIdentifierList
 * ;
 * @compile-error
 * @description Checks that a class can't be defined inside another class as it is not among
 * the allowed class member definitions.
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  class B {}
}

main() {
  try {
    A a = new A();
  } catch (e) {}
}
