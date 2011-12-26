/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interfaceDefinition:
 * interface identifier typeParameters? superinterfaces? factorySpecification? 
 * '{' (interfaceMemberDefinition)* '}'
 * ;
 * interfaceMemberDefinition:
 *   static final type? initializedIdentifierList ';' |
 *   functionSignature ';' |
 *   constantConstructorSignature ';' |
 *   namedConstructorSignature ';' |
 *   getterSignature ';' |
 *   setterSignature ';' |
 *   operatorSignature ';' |
 *   variableDeclaration ';'
 * ;
 * @description Checks that static interface members must be final.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 */

interface A {
  static var a;
}

class B implements A {}

main() {
  try {
    new B();
  } catch(var e) {}
}
