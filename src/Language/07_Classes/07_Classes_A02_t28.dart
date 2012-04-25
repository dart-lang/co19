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
 * @description Checks that it is a compile-time error if a function signature is declared final.
 * @compile-error
 * @author kaigorodov
 * @reviewer iefremov
 */

class A {
  final String a() {return null;}
}

main() {
  try {
    A a = new A();
    a.a();
  } catch(var e) {}
}