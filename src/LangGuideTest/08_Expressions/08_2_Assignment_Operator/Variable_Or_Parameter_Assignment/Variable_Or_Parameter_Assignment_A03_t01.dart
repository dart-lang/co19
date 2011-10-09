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
 * @description Checks that operator = works correctly.
 * @author msyabro
 * @reviewer pagolubev
 */


void foo(var x) {
  x = 1;
  Expect.isTrue(x == 1);

  x = 3 + 6 / 3;
  Expect.isTrue(x == 5);
}

void main() {
  var x;
  x = 1;
  Expect.isTrue(x == 1);

  x = 3 + 6 / 3;
  Expect.isTrue(x == 5);

  foo(0);
}
