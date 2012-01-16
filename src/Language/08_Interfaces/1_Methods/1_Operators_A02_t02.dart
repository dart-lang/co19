/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Operators are instance methods with special names.
 * @description Checks that marking an operator as static in an interface causes an error.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @needsreview The exact type of error is not specified in chapter 8, 
 * but chapter 7 (Classes) says it's a compile-time error.
 */

interface I {
  static I operator ++();
}

class A implements I {}

main() {
  try {
    new A();
  } catch(var e) {}
}

