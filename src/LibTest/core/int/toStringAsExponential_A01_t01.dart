/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsExponential(int fractionDigits) 
 * Converts a number into string using exponential notation.
 * @description Checks that this method returns correct value.
 * @author vasya
 * @author msyabro
 * @reviewer rodionov
 * @needsreview Specifics of the method as well as range for [fractionDigits] undocumented
 */

main() {

  Expect.equals("1e+2", 100.toStringAsExponential(0));
  Expect.equals("1.0e+2", 100.toStringAsExponential(1));
  Expect.equals("1.00e+2", 100.toStringAsExponential(2));
  Expect.equals("1.000e+2", 100.toStringAsExponential(3));
  Expect.equals("1.0000e+2", 100.toStringAsExponential(4));
  Expect.equals("1.00000e+2", 100.toStringAsExponential(5));
  Expect.equals("1.000000e+2", 100.toStringAsExponential(6));
  Expect.equals("1.0000000e+2", 100.toStringAsExponential(7));
  Expect.equals("1.00000000e+2", 100.toStringAsExponential(8));
  Expect.equals("1.000000000e+2", 100.toStringAsExponential(9));
  Expect.equals("1.0000000000e+2", 100.toStringAsExponential(10));
  
  Expect.equals("-1e+2", (-100).toStringAsExponential(0));
  Expect.equals("-1.0000000000e+2", (-100).toStringAsExponential(10));

  Expect.equals("1e+8", 123456789.toStringAsExponential(0));
  Expect.equals("1.2e+8", 123456789.toStringAsExponential(1));
  Expect.equals("1.23e+8", 123456789.toStringAsExponential(2));
  Expect.equals("1.234e+8", 123456789.toStringAsExponential(3));
  Expect.equals("1.2345e+8", 123456789.toStringAsExponential(4));
  Expect.equals("1.23456e+8", 123456789.toStringAsExponential(5));
  Expect.equals("1.234567e+8", 123456789.toStringAsExponential(6));
  Expect.equals("1.2345678e+8", 123456789.toStringAsExponential(7));
  Expect.equals("1.23456789e+8", 123456789.toStringAsExponential(8));
  Expect.equals("1.234567890e+8", 123456789.toStringAsExponential(9));
  Expect.equals("1.2345678900e+8", 123456789.toStringAsExponential(10));

  Expect.equals("-1e+8", (-123456789).toStringAsExponential(0));
  Expect.equals("-1.2345678900e+8", (-123456789).toStringAsExponential(10));

  // derived from Java's "%.#e" formatting of float 0.0
  Expect.equals("0e+00", 0.toStringAsExponential(0));
  Expect.equals("0.0e+00", 0.toStringAsExponential(1));
  Expect.equals("0.00e+00", 0.toStringAsExponential(2));
  Expect.equals("0.000e+00", 0.toStringAsExponential(3));
  Expect.equals("0.0000e+00", 0.toStringAsExponential(4));
  Expect.equals("0.00000e+00", 0.toStringAsExponential(5));
  Expect.equals("0.000000e+00", 0.toStringAsExponential(6));
  Expect.equals("0.0000000e+00", 0.toStringAsExponential(7));
  Expect.equals("0.00000000e+00", 0.toStringAsExponential(8));
  Expect.equals("0.000000000e+00", 0.toStringAsExponential(9));
  Expect.equals("0.0000000000e+00", 0.toStringAsExponential(10));
  
  Expect.equals("1", 1.toStringAsExponential(0));
  Expect.equals("1.0", 1.toStringAsExponential(1));
  Expect.equals("1.00", 1.toStringAsExponential(2));
  Expect.equals("1.000", 1.toStringAsExponential(3));
  Expect.equals("1.0000", 1.toStringAsExponential(4));
  Expect.equals("1.00000", 1.toStringAsExponential(5));
  Expect.equals("1.000000", 1.toStringAsExponential(6));
  Expect.equals("1.0000000", 1.toStringAsExponential(7));
  Expect.equals("1.00000000", 1.toStringAsExponential(8));
  Expect.equals("1.000000000", 1.toStringAsExponential(9));
  Expect.equals("1.0000000000", 1.toStringAsExponential(10));
}
