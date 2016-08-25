/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 *   metadata abstract? class identifier typeParameters? (superclass mixins?)? 
 * interfaces? ‘{’ (metadata classMemberDefinition)* ‘}’ |
 *   metadata abstract? class mixinApplicationClass
 * ;
 * @description Checks that it is a compile-time error if mixin has incorrect 
 * declaration in a class definition.
 * @compile-error
 * @author hlodvig
 */

class A {}
class B1 {}
class B2 {}

class C extends A with B1 B2 {}

main() {
  try {
    new A();
  } catch (e) {}
}
