/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of one of the forms e1 - e2, e1 * e2, e1 / e2, e1 > e2, e1 < e2,
 * e1 >= e2, e1 <= e2 or e1 % e2, where e1 and e2 are constant expressions
 * that evaluate to a numeric value is a constant expression.
 * @description Checks that various expressions of the specified forms can be
 * assigned to a static final variable and are, therefore, constant expressions.
 * @author iefremov
 * @reviewer rodionov
 */

final x1 = 1 - 2e0;
final x2 = 1 * 2E-0;
final x3 = 1 / 2;
final x4 = 1 > 2;
final x5 = 1 < 2;
final x6 = 1 >= 2;
final x7 = 1 <= 2;
final x8 = 1 % 2;

final y1 = 1.42 - 2;
final y2 = 1.42 * 2;
final y3 = 1.42 / 2;
final y4 = 1.42 > 2;
final y5 = 1.42 < 2;
final y6 = 1.42 >= 2;
final y7 = 1.42 <= 2;
final y8 = 1.42 % 2;

final z1 = 1 - 2.42;
final z2 = 1 * 2.42;
final z3 = 1 / 2.42;
final z4 = 1 > 2.42;
final z5 = 1 < 2.42;
final z6 = 1 >= 2.42;
final z7 = 1 <= 2.42;
final z8 = 1 % 2.42;

final d1 = 1.42 - 2.42;
final d2 = 1.42 * 2.42;
final d3 = 1.42 / 2.42;
final d4 = 1.42 > 2.42;
final d5 = 1.42 < 2.42;
final d6 = 1.42 >= 2.42;
final d7 = 1.42 <= 2.42;
final d8 = 1.42 % 2.42;


main() {
  var z = x1 + x2 + x3 + x8 + y1 + y2 + y3 + y8 + z1 + z2 + z3 + z8 + d1 + d2 + d3 + d8;
  var x = x4 || x5 || x6 || x7 || y4 || y5 || y6 || y7 || z4 || z5 || z6 || z7 || d4 || d5 || d6 || d7;
  Expect.isTrue(z > 0);
  Expect.isTrue(x);
}
