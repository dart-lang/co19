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
 * @description Check if || operator works properly
 * @author msyabro
 * @reviewer akuznecov
 */
 

main() {
  var b = true || true;
  Expect.isTrue(b == true);
  
  b = false || false;
  Expect.isTrue(b == false);
  
  b = false || true;
  Expect.isTrue(b == true);
  
  b = true || false;
  Expect.isTrue(b == true);
}
