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
 *   constantConstructorSignature (redirection | initializers)? |
 *   constructorSignature (redirection | initializers)? |
 *   functionSignature redirection |
 *   namedConstructorSignature redirection |
 *   abstract getterSignature |
 *   abstract setterSignature |
 *   abstract operatorSignature |
 *   abstract functionSignature |
 *   static final type? staticFinalDeclarationList |
 *   static? initializedVariableDeclaration
 * ;
 * staticFinalDeclarationList:
 *   staticFinalDeclaration (', ' staticFinalDeclaration)*
 * ;
 * staticFinalDeclaration:
 *   identifier '=' expression
 * ;
 * @description Checks that it is a compile-time error if a redirecting named constructor
 * declaration includes a body.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 * @needsreview issue 977
 */

class A {
  A.B(): this.C() {}
  A.C() {}
}

main() {
  try {
    A a = new A.B();
  } catch(var e) {}
}