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
 * @description Checks that it is a compile-time error if a closing curly 
 * bracket is missed in a class type definition. Class body is empty.
 * @compile-error
 * @author msyabro
 */

class A {

main() {
  try {
    new A();
  } catch (e) {}
}
