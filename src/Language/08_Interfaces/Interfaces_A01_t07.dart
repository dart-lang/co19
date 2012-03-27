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
 * @description Checks that functionSignature in interface cannot be declared abstract.
 * @compile-error
 * @author kaigorodov
 * @reviewer iefremov
 */

interface I {
  abstract void close(); 
}

class C implements I {
  void close() {} 
}

main() {
 try {
   I i1=new C();
   print(i1);
 } catch(var x) {
 }
}
