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
 * @description Checks that putting one interface definition inside another
 * causes a compile-time error.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

interface I {
  interface B {}
}

class C implements I {}

main() {
 try {
   I i1=new C();
   assert(i1!=null);
 } catch(x) {
 }
}
