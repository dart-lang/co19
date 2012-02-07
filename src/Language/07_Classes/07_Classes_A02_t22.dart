/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * class identifier typeParameters? superclass? interfaces?
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
 * @description Checks that it is a compile-time error if an abstract operator
 * declaration does not end with a semicolon.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  abstract operator==(A other )
}

main() {
  try {
    A a = new A();
  } catch(var e) {}
}