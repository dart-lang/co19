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
 * @description Checks that specifying an interface type in a factory specification
 * results in a compile-time error.
 * @author rodionov
 * @reviewer kaigorodov
 * @compile-error
 */

interface Foo {}

interface I default Foo {
  I();
}

class A implements I {}

main() {
  try {
    new A();
  } catch(var e) {}
}
