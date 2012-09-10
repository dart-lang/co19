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
 * superinterfaces:
 *   extends typeList
 * ;
 * factorySpecification:
 *   default qualified typeParameters?
 * ;
 * @description Checks that a factory clause can not be declared outside class.
 * @author kaigorodov
 * @reviewer iefremov
 * @compile-error
 */

factory F.I() {}

class F {
}

interface I extends SI default F {
  I();
}

interface SI {}

main() {
  try {
    new I();
  } catch(x) {}
}
