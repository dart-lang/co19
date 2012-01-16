/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the implements clause of an class C
 * includes a type expression that does not denote a class or interface available
 * in the lexical scope of C.
 * @description Checks that it is a compile-time error when the type expression
 * in a class's implements clause denotes a variable name.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

int foo;

class A implements foo {}

main() {
  try {
    A a = new A();
  } catch(var x){}
}
