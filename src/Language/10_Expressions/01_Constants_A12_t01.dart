/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of one of the forms ~e, e1 ~/ e2, e1 ^ e2, e1 & e2, e1 | e2,
 * e1 >> e2 or e1 << e2, where e1 and e2 are constant expressions that
 * evaluate to an integer value is a constant expression.
 * @description Checks that various expressions of the specified forms can be assigned 
 * to a static final variable and are, therefore, constant expressions.
 * @author iefremov
 * @reviewer rodionov
 */

final x = ~1;
final x1 = 1 ~/ x;
final x2 = 1 ^ 0xFF;
final x3 = 0xCAFE & 0xBABE;
final x4 = 0xDEAD | 0xBEEF;
final x5 = 1 >> 100;
final x6 = 100 << 1;
final x7 = ~((x2 ~/ 2) & (100500 >> 2))  | (~1 ^ (1<<x4));

main() {
  var z = x+x1+x2+x3+x4+x5+x6+x7;
  Expect.isNotNull(z);
}
