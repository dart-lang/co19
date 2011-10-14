/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All numbers support basic arithmetic operations (+, -, *, /, and 
 * %) and the standard comparison operations (<, <=, > and >=) .
 * @description Check basic arithmetic operations support for int
 * @author akuznecov
 */


main() {
  Expect.isTrue(2 + 5 == 7); 
  Expect.isTrue(2 - 5 == -3); 
  Expect.isTrue(2 * -5 == -10); 
  Expect.isTrue(-10 / 2 == -5); 
  Expect.isTrue(10 / -2 == -5); 
  Expect.isTrue(5 % 2 == 1); 

  // comparsion
  Expect.isTrue(2 < 3); 
  Expect.isTrue(3 > 2); 
  Expect.isTrue(2 <= 2); 
  Expect.isTrue(3 >= 3);

  Expect.isTrue(-2 > -3); 
  Expect.isTrue(-3 < -2); 
  Expect.isTrue(-2 <= -2); 
  Expect.isTrue(-3 >= -3);

  Expect.isTrue(2 > -3);
  Expect.isTrue(-0 >= 0);
  Expect.isTrue(-0 <= 0);
  Expect.isTrue(!(-0 < 0));
}
