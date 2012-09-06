/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * metadata abstract? class identifier typeParameters? superclass? interfaces?
 *   '{' classMemberDefinition* '}'
 * ;
 * classMemberDefinition:
 *   metadata declaration ';' |
 *   metadata methodSignature functionBody
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
 * @description Checks that it is not a compile-time error when constructor is declared abstract.
 * @author kaigorodov
 */

class C {
  C();
}


main() {
  try {
    new C();
  } catch (e) {}
}
