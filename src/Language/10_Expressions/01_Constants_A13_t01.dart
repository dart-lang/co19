/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  An expression of the form e1 + e2 where e1 and e2 are either constant
 * expressions that both evaluate to a numeric value or constant expressions
 * that both evaluate to a string value is a constant expression.
 * @description Checks that various expressions of the form e1+e2 can be assigned
 * to a static final variable and are, therefore, constant expressions.
 * @author iefremov
 * @reviewer rodionov
 */

final x1 = 1 + 2;
final x2 = "hello" + "world";
final x3 = 3.14 + 1;
final x4 = 1 + 3.14;
final x5 = 3.14 + 3.14;
final x6 = (3.14 * 15926) + (1 ~/ 100); 

main() {
  var z = x1 + x3 + x4 + x5 + x6;
  Expect.isTrue(z > 0);
  Expect.equals("helloworld", x2);
}
