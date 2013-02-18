/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsExponential([int fractionDigits]) 
 * Converts this to a string in decimal exponential notation with fractionDigits digits after the decimal point.
 * @description Checks that this method returns correct value when fractionDigits is specified.
 * @author vasya
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

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
  Expect.equals("1.235e+8", 123456789.toStringAsExponential(3));
  Expect.equals("1.2346e+8", 123456789.toStringAsExponential(4));
  Expect.equals("1.23457e+8", 123456789.toStringAsExponential(5));
  Expect.equals("1.234568e+8", 123456789.toStringAsExponential(6));
  Expect.equals("1.2345679e+8", 123456789.toStringAsExponential(7));
  Expect.equals("1.23456789e+8", 123456789.toStringAsExponential(8));
  Expect.equals("1.234567890e+8", 123456789.toStringAsExponential(9));
  Expect.equals("1.2345678900e+8", 123456789.toStringAsExponential(10));

  Expect.equals("-1e+8", (-123456789).toStringAsExponential(0));
  Expect.equals("-1.2345678900e+8", (-123456789).toStringAsExponential(10));

  // derived from Java's "%.#e" formatting of float 0.0
  Expect.equals("0e+0", 0.toStringAsExponential(0));
  Expect.equals("0.0e+0", 0.toStringAsExponential(1));
  Expect.equals("0.00e+0", 0.toStringAsExponential(2));
  Expect.equals("0.000e+0", 0.toStringAsExponential(3));
  Expect.equals("0.0000e+0", 0.toStringAsExponential(4));
  Expect.equals("0.00000e+0", 0.toStringAsExponential(5));
  Expect.equals("0.000000e+0", 0.toStringAsExponential(6));
  Expect.equals("0.0000000e+0", 0.toStringAsExponential(7));
  Expect.equals("0.00000000e+0", 0.toStringAsExponential(8));
  Expect.equals("0.000000000e+0", 0.toStringAsExponential(9));
  Expect.equals("0.0000000000e+0", 0.toStringAsExponential(10));
  
  Expect.equals("1e+0", 1.toStringAsExponential(0));
  Expect.equals("1.0e+0", 1.toStringAsExponential(1));
  Expect.equals("1.00e+0", 1.toStringAsExponential(2));
  Expect.equals("1.000e+0", 1.toStringAsExponential(3));
  Expect.equals("1.0000e+0", 1.toStringAsExponential(4));
  Expect.equals("1.00000e+0", 1.toStringAsExponential(5));
  Expect.equals("1.000000e+0", 1.toStringAsExponential(6));
  Expect.equals("1.0000000e+0", 1.toStringAsExponential(7));
  Expect.equals("1.00000000e+0", 1.toStringAsExponential(8));
  Expect.equals("1.000000000e+0", 1.toStringAsExponential(9));
  Expect.equals("1.0000000000e+0", 1.toStringAsExponential(10));
}
