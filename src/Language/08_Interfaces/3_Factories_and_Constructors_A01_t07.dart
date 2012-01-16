/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interfaceDefinition:
 * interface identifier typeParameters? superinterfaces? factorySpecification? '{'
 *   (interfaceMemberDefinition)* '}'
 * ; 
 * factorySpecification:
 *   default qualified typeParameters?
 * ;
 * @description Checks that it is a compile-time error if the factory clause
 * precedes the extends clause in an interface declaration.
 * @author rodionov
 * @reviewer kaigorodov
 * @compile-error
 */

class F {
  F() {}
}

interface I default F extends SI {
  I();
}

interface SI {}

main() {
  try {
    new I();
  } catch(var e) {}
}
