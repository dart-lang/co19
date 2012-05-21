/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of one of the forms -e, e1 - e2, e1 * e2,  e1 / e2, e1 ~/ e2, e1 > e2, e1 < e2,
 * e1 >= e2, e1 <= e2 or e1 % e2, where e1 and e2 are constant expressions
 * that evaluate to a numeric value or to null is a constant expression.
 * @description Checks that various expressions of the specified forms can be
 * elements of a constant list literal and are, therefore, constant expressions.
 * @author iefremov
 * @reviewer rodionov
 */

final constList = const [
  -1,
  -0,
  -100500,
  -999999999999999999999999,
  -9182319.12394,
  -3.14,
  -(0.0/0.0),
  -(1.0/0.0),
  -0.0,


  1 - 2e0,
  1 * 2E-0,
  1 / 2,
  1 > 2,
  1 < 2,
  1 >= 2,
  1 <= 2,
  1 % 2,

  1.42 - 2,
  1.42 * 2,
  1.42 / 2,
  1.42 > 2,
  1.42 < 2,
  1.42 >= 2,
  1.42 <= 2,
  1.42 % 2,

  1 - 2.42,
  1 * 2.42,
  1 / 2.42,
  1 > 2.42,
  1 < 2.42,
  1 >= 2.42,
  1 <= 2.42,
  1 % 2.42,

  1.42 - 2.42,
  1.42 * 2.42,
  1.42 / 2.42,
  1.42 > 2.42,
  1.42 < 2.42,
  1.42 >= 2.42,
  1.42 <= 2.42,
  1.42 % 2.42,

  1.42 ~/ 1.42,
  5 ~/ 1,
  0.2 ~/ 2,
  1 ~/ (2 + 1)
];


main() {
  Expect.isTrue(constList is List);
}
