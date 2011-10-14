/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of conditional expression:
 * 1. Evaluate condition subject to boolean conversion. Store the result in a fresh final variable, c.
 * 2. If true === c, then the result of the conditional expression is the result of evaluating expression1; expression2 is not evaluated.
 *    Otherwise, the result of the conditional expression is the result of evaluating expression2; expression1 is not evaluated.
 * @description Check that conditional expression is evaluated properly
 * @author msyabro
 * @reviewer akuznecov
 */
 

main() {
  var x = 0;
  var res;
  res = (true ? (x = 1) : (x = 2));
  Expect.isTrue(res == 1);
  Expect.isTrue(x == 1);
  
  res = (false ? (x = 1) : (x = 2));
  Expect.isTrue(res == 2);
  Expect.isTrue(x == 2);
}
