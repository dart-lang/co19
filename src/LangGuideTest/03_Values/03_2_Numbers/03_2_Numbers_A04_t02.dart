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
 * @description Checks that arithmetic operations on a double and a rational yield double.
 * @author pagolubev
 * @reviewer akuznecov
 * @needsreview Are rationals still supported
 * Same tests are in 04_2_A01. Operator % is also available for doubles 
 */


  
void check(double x, Rational y) {
  Expect.isTrue(x + y is double);
  Expect.isTrue(x - y is double);
  Expect.isTrue(x * y is double);
  Expect.isTrue(x / y is double);
}

void main() {
  check(0.01d, 0.03);
  check(-5.01d, 0.07);
  check(6d, 7);
  check(1e4d, 2);
  check(5e13d, -2e5);

  foo(4.9406564584124654e-324d, 1e-324);
  foo(-4.9406564584124654e-324d, 1e-324);
  foo(4.9406564584124654e-324d, 133.33);
  foo(4.9406564584124654e-324d, 1e100);
  foo(4.9406564584124654e-324d, 3/7);

  foo(2.2250738585072009e-308d, 1e-308);
  foo(-2.2250738585072009e-308d, 1e-308);
  foo(-2.2250738585072009e-308d, 111.1111);
  foo(4.9406564584124654e-324d, 8/13);

  foo(2.2250738585072009e-308d, 4.9406564584124654e-324);
  foo(1.7976931348623157e308d, 2.2250738585072014e-308);

  foo(2.2250738585072014e-308d, 1e-308);
  foo(-2.2250738585072014e-308d, 1e-308);
  foo(-2.2250738585072014e-308d, 1e222);
  
  foo(1.7976931348623157e308d, 1e308);
  foo(-1.7976931348623157e308d, 1e308);
  foo(1.7976931348623157e308d, 1e-1000);
  foo(1.7976931348623157e308d, 6/13);

  foo(1e1000d, 1e1000);
  foo(1e1000d, 1e-1000);
  foo(1e-1000d, 1e-1000);

  foo(4.9406564584124654e-324d, 0);
  foo(4.9406564584124654e-324d, 0);
  foo(4.9406564584124654e-324d, 8/9);
  foo(4.9406564584124654e-324d, 0.6);
}
