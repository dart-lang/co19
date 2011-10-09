/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Arithmetic operations on numbers will always yield results of the same category
 * (rational or floating-point) as the input operands. If the operands are not of the same
 * category then the rational input is first converted to a double and the output will be a
 * double. 
 * @description Checks that arithmetic operations on doubles yield doubles.
 * @author pagolubev
 * @needsreview Same tests are in 04_2_A01. Operator % is also available for doubles 
 */


  
void check(double x, double y) {
  Expect.isTrue(x + y is double);
  Expect.isTrue(x - y is double);
  Expect.isTrue(y - x is double);
  Expect.isTrue(x * y is double);
  Expect.isTrue(x / y is double);
}

void main() {
  check(0.01, 0.03);
  check(-5.01, 0.07);
  check(6, 7);
  check(1e4, 2);
  check(5e13, -2e5);

  check(4.9406564584124654e-324, 1e-324);
  check(-4.9406564584124654e-324, 1e-324);
  check(4.9406564584124654e-324, 133.33);
  check(4.9406564584124654e-324, 1e100);

  check(2.2250738585072009e-308, 1e-308);
  check(-2.2250738585072009e-308, 1e-308);
  check(-2.2250738585072009e-308, 111.1111);

  check(2.2250738585072009e-308, 4.9406564584124654e-324);
  check(1.7976931348623157e308, 2.2250738585072014e-308);

  check(2.2250738585072014e-308, 1e-308);
  check(-2.2250738585072014e-308, 1e-308);
  check(-2.2250738585072014e-308, 1e222);
  
  check(1.7976931348623157e308, 1e308);
  check(-1.7976931348623157e308, 1e308);
  check(1.7976931348623157e308, 1e-1000);

  check(1e1000, 1e1000);
  check(1e1000, 1e-1000);
  check(1e-1000, 1e-1000);

  check(4.9406564584124654e-324, +0.);
  check(4.9406564584124654e-324, -0.);

  check(2.2250738585072009e-308, +0.);
  check(2.2250738585072009e-308, -0.);

  check(2.2250738585072014e-308, +0.);
  check(2.2250738585072014e-308, -0.);

  check(1.7976931348623157e308, +0.);
  check(1.7976931348623157e308, -0.);
}
