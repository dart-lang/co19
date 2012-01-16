/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface may contain getter and/or setter signatures.
 * interfaceMemberDefinition:
 * static final type? initializedIdentifierList `;' |
 *   ...
 *   getterSignature `;' |
 *   setterSignature `;' |
 *   ...
 * ; 
 * getterSignature:
 *   static? returnType? get identifier formalParameterList
 * ;
 * setterSignature:
 *   static? returnType? set identifier formalParameterList
 * ;
 * @description Check that it is permitted for an interface to declare a static setter.
 * @author rodionov
 * @needsreview results in a compile error  # issue 679
 * @reviewer kaigorodov
 */

interface I  {
  static void set m(int v);
}

class A implements I {}

main() {
 try{
   I i1=new A();
   I i2=new A();
   assert(i1!=i2);
 } catch(var x) {}
}