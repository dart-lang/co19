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
 * @description Check that an interface is not permitted to declare a setter with a body.
 * @author rodionov
 * @reviewer kaigorodov
 * @compile-error
 */

interface I  {
  void set m(int foo) {};
}

class A implements I {}

main() {
  try {
    new A();
  } catch(e) {}
}
