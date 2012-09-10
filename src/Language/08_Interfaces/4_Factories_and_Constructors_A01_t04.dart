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
 * typeParameters:
 *   ‘<’ typeParameter (‘,’ typeParameter)* ‘>’
 * ;
 * @description Checks that specifying a factory class name with an empty type parameter list
 * in a factory specification results in a compile-time error.
 * @author rodionov
 * @reviewer kaigorodov
 * @compile-error
 */

class Foo<T, S> {
  Foo() {}
}

interface I default Foo<> {
  I();
}

class A implements I {}

main() {
  try {
    new A();
  } catch(e) {}
}
