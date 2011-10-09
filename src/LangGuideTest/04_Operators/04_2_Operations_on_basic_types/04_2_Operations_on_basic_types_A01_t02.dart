/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All numbers support basic arithmetic operations (+, -, *, /, and 
 * %) and the standard comparison operations (<, <=, > and >=) .
 * @description Check arithmetic operations support for double
 * @author akuznecov
 */


void main() {
  Expect.isTrue(5.0 + 4.0 == 9.0); 
  Expect.isTrue(4.0 - 5.0 == -1.0); 
  Expect.isTrue(2.0 * -3.0 == -6.0); 
  5.0 / 2.0; 
  Expect.isTrue(5.0 % 2.0 == 1.0); 
  Expect.isTrue(0.0 + -0.0 == 0.0); 
  Expect.isTrue(0.0 - -0.0 == 0.0); 
  Expect.isTrue(0.0 * -0.0 == 0.0); 
  Expect.isTrue(-0.0 * 0.0 == 0.0); 
  Expect.isTrue(2.0 * -0.0 == 0.0); 

  // comparsion
  Expect.isTrue(2.0 < 2.1); 
  Expect.isTrue(0.2 < 0.3); 
  Expect.isTrue(0.3 > 0.2); 
  Expect.isTrue(0.2 <= 0.2); 
  Expect.isTrue(0.3 >= 0.3);

  Expect.isTrue(-0.2 > -0.3); 
  Expect.isTrue(-0.3 < -0.2); 
  Expect.isTrue(-0.2 <= -0.2); 
  Expect.isTrue(-0.3 >= -0.3);

  Expect.isTrue(0.2 > -0.3);
  Expect.isTrue(-0.0 >= 0.0);
  Expect.isTrue(-0.0 <= 0.0);
  Expect.isTrue(!(-0.0 < 0.0));
}
