/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Operators are instance methods with special names.
 * 8.1: An interface method declaration specifies a method signature but no body.
 * @description Checks that an interface operator declaration including a body results in a
 * compile-time error.
 * @author vasya
 * @compile-error
 * @reviewer rodionov
 */

interface I {
  bool operator ==(I other) {};
}

class A implements I {}

main() {
  try {
    new A();
  } catch(var e) {}
}

