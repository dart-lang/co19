/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of static-field assignment:
 * 1. The expression rhs is evaluated and the result is stored in a fresh final variable, v.
 * 2. The static setter (implicit or explicit) for identifier is evaluated as the static-method invocation C.setIdentifier(v),
 *    where setIdentifier is an implementation specific name of the setter. 
 * 3. The result of the assignment expression is v.
 * @description Check that operator = works correctly
 * @author msyabro
 * @reviewer pagolubev
 */

class A {
  static var x;
}


main() {
  A.x = 1;
  Expect.isTrue(A.x == 1);

  A.x = 5 / 3 * 6;
  Expect.isTrue(A.x == 10);
}
