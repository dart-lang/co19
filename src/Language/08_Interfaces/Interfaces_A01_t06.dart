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
 * @description Checks that interface cannot be declared abstract.
 * @compile-error
 * @author kaigorodov
 * @reviewer iefremov
 */

abstract interface I {}

class C implements I {}

main() {
 try {
   I i1=new C();
   print(i1);
 } catch(var x) {
 }
}
