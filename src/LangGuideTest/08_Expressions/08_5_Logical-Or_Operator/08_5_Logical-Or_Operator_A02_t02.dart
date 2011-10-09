/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation: 
 * 1. Evaluate expression1 subject to boolean conversion. Store the result in a fresh final variable, c.
 * 2. If true === c, then the result of the logical-or expression is true; expression2 is not evaluated. 
 *    Otherwise, the result of the logical-or expression is the result of evaluating expression2 subject to boolean conversion.
 * @description If first expression is true, second expression is not evaluated
 * @author msyabro
 * @reviewer akuznecov
 * @needsreview crash in cold expression or check it's side effects?
 */
 

void main() {
  var b = true || (Expect.fail("Second part must not be evaluated"));
}
