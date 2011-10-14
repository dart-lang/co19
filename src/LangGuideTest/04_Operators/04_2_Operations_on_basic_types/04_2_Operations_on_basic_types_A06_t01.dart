/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If either operand of arithmetic operation is a double, 
 * then the other operand is converted to a double first (if necessary) 
 * and the operation returns a double.
 * @description Check that result will be double if either operand is double
 * @author akuznecov
 */


main() {
  Expect.isTrue((4.0 + 2) is double);  
  Expect.isTrue((4 + 2.0) is double);  

  Expect.isTrue((4.0 - 2) is double);  
  Expect.isTrue((4 - 2.0) is double);  

  Expect.isTrue((4.0 * 2) is double);  
  Expect.isTrue((4 * 2.0) is double);  

  Expect.isTrue((4.0 / 2) is double);  
  Expect.isTrue((4 / 2.0) is double);  

  Expect.isTrue((4.0 % 2) is double);  
  Expect.isTrue((4 % 2.0) is double);  
}
