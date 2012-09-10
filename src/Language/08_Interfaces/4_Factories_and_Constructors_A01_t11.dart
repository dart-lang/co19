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
 * @description Checks that the 'default' keyword cannot be replaced with 'factory'.
 * @author kaigorodov
 * @reviewer iefremov
 * @compile-error
 * @needsreview issue 3220
 */

interface I factory A {
  I();
}

class A implements I {}

main() {
  try {
    new A();
  } catch(e) {}
}

