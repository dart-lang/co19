/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of instance-field assignment: 
 * 1. The expression lhs is evaluated and the result is stored in a fresh final variable, r.
 * 2. The expression rhs is evaluated and the result is stored in a fresh final variable, v.
 * 3. The setter (implicit or explicit) for identifier is evaluated as the instance-method invocation r.setIdentifier(v),
 *    where setIdentifier is an implementation specific name of the setter.
 * 4. The result of the assignment expression is v.
 * @description Check that operator = works correctly
 * @author msyabro
 * @reviewer pagolubev
 */

class A {
  var x;
  A() {}
}


void main() {
  A a = new A();
  a.x = 1;
  Expect.isTrue(a.x == 1);

  a.x = 4 - 2*2;
  Expect.isTrue(a.x == 0);
}
