/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation: 
 * 1. Evaluate expression1 subject to boolean conversion. Store the result in a fresh final variable, c.
 * 2. If true === c, then the result of the logical-and expression is the result of evaluating expression2 subject to boolean conversion.
 *    Otherwise, the result of the logical-and expression is false; expression2 is not evaluated.
 * @description If first expression is false second expression is not evaluated
 * @author msyabro
 * @reviewer akuznecov
 * @needsreview  
 */
 

main() {
  var b = false && Expect.fail("Second part must not be evaluated");
}
