/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsFixed(int fractionDigits)
 * Returns a decimal-point string-representation of this.
 *
 * Converts this to a double before computing the string representation.
 *
 * If the absolute value of this is greater or equal to 10^21 then this methods
 * returns an exponential representation computed by
 * this.toStringAsExponential(). Otherwise the result is the closest string
 * representation with exactly fractionDigits digits after the decimal point.
 * If fractionDigits equals 0 then the decimal point is omitted.
 *
 * The parameter fractionDigits must be an integer satisfying:
 * 0 <= fractionDigits <= 20.
 * @description Checks that this method returns correct value.
 * @author vasya
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("10", 10.toStringAsFixed(0));
  Expect.equals("10.0", 10.toStringAsFixed(1));
  Expect.equals("10.00", 10.toStringAsFixed(2));
  Expect.equals("10.000", 10.toStringAsFixed(3));
  Expect.equals("10.0000", 10.toStringAsFixed(4));
  Expect.equals("10.00000", 10.toStringAsFixed(5));
  Expect.equals("10.000000", 10.toStringAsFixed(6));
  Expect.equals("10.0000000", 10.toStringAsFixed(7));
  Expect.equals("10.00000000", 10.toStringAsFixed(8));
  Expect.equals("10.000000000", 10.toStringAsFixed(9));
  Expect.equals("10.0000000000", 10.toStringAsFixed(10));
  
  Expect.equals("0", 0.toStringAsFixed(0));
  Expect.equals("0.0", 0.toStringAsFixed(1));
  Expect.equals("0.00", 0.toStringAsFixed(2));
  Expect.equals("0.000", 0.toStringAsFixed(3));
  Expect.equals("0.0000", 0.toStringAsFixed(4));
  Expect.equals("0.00000", 0.toStringAsFixed(5));
  Expect.equals("0.000000", 0.toStringAsFixed(6));
  Expect.equals("0.0000000", 0.toStringAsFixed(7));
  Expect.equals("0.00000000", 0.toStringAsFixed(8));
  Expect.equals("0.000000000", 0.toStringAsFixed(9));
  Expect.equals("0.0000000000", 0.toStringAsFixed(10));
  
  Expect.equals("123456789", 123456789.toStringAsFixed(0));
  Expect.equals("123456789.0", 123456789.toStringAsFixed(1));
  Expect.equals("123456789.00", 123456789.toStringAsFixed(2));
  Expect.equals("123456789.000", 123456789.toStringAsFixed(3));
  Expect.equals("123456789.0000", 123456789.toStringAsFixed(4));
  Expect.equals("123456789.00000", 123456789.toStringAsFixed(5));
  Expect.equals("123456789.000000", 123456789.toStringAsFixed(6));
  Expect.equals("123456789.0000000", 123456789.toStringAsFixed(7));
  Expect.equals("123456789.00000000", 123456789.toStringAsFixed(8));
  Expect.equals("123456789.000000000", 123456789.toStringAsFixed(9));
  Expect.equals("123456789.0000000000", 123456789.toStringAsFixed(10));
}
