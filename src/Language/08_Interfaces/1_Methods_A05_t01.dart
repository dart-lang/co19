/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interfaceMemberDefinition:
 *   static final type? initializedIdentifierList `;' |
 *   functionSignature `;' |
 *   constantConstructorSignature `;' |
 *   namedConstructorSignature `;' |
 *   getterSignature `;' |
 *   setterSignature `;' |
 *   operatorSignature `;' |
 *   variableDeclaration `;'
 * ;
 * @description Checks that an interface is not permitted to declare static methods.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 */

interface I {
  static bool m();
}

class A implements I {}

main() {
  try {
    new A();
  }catch(e) {}
}
