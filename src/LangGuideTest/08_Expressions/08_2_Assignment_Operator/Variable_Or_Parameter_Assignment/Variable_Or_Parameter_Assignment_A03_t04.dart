/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of variable or parameter assignment:
 * 1. The expression rhs is evaluated and the result is stored in a fresh final variable, v.
 * 2. It is a dynamic type error if v is neither null nor an is the declared type of identifier. 
 * 3. The value stored in v is stored in the parameter or variable identifier. 
 * 4. The result of the assignment expression is v.
 * @description Checks that assignment to an expression that yields a result of type that is
 * not the declared type of identifier produces an error.
 * @author pagolubev
 * @dynamic-type-error
 * @reviewer msyabro
 */

class A {
  A() {}
}


A foo() { return new A(); }

void main() {
  int x;
  x = foo();
}
