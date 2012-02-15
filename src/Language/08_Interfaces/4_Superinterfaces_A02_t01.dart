/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the extends clause of an interface I includes
 * a type expression that does not denote a class or interface available in the lexical scope of I. 
 * @description Checks that it is a compile-time error if the extends clause of an interface includes
 * a function type.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 */

typedef void foo();

interface I extends foo {}

class A implements I {}

main() {
  try {
    new A();
  } catch(var e) {}
}

