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
 * @description Check that it is permitted for an interface to declare a static getter.
 * @author rodionov
 * @reviewer kaigorodov
 * @needsreview results in a compile error  # issue 679
 */

interface I  {
  static int get m();
}

class A implements I {}

main() {
   I i1=new A();
   I i2=new A();
   Expect.isTrue(i1!=i2);
}
