/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsFixed(int fractionDigits)
 * Converts a number into string with the specified number of digits after the decimal point.
 * @description Checks that this method returns correct value.
 * @author vasya
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview Unimplemented and undocumented
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("10",10.toStringAsFixed(0));
  Expect.equals("10.0",10.toStringAsFixed(1));
  Expect.equals("10.00",10.toStringAsFixed(2));
  Expect.equals("10.000",10.toStringAsFixed(3));
  Expect.equals("10.0000",10.toStringAsFixed(4));
  Expect.equals("10.00000",10.toStringAsFixed(5));
  Expect.equals("10.000000",10.toStringAsFixed(6));
  Expect.equals("10.0000000",10.toStringAsFixed(7));
  Expect.equals("10.00000000",10.toStringAsFixed(8));
  Expect.equals("10.000000000",10.toStringAsFixed(9));
  Expect.equals("10.0000000000",10.toStringAsFixed(10));
  
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
  
  Expect.equals("123456789",123456789.toStringAsFixed(0));
  Expect.equals("123456789.0",123456789.toStringAsFixed(1));
  Expect.equals("123456789.00",123456789.toStringAsFixed(2));
  Expect.equals("123456789.000",123456789.toStringAsFixed(3));
  Expect.equals("123456789.0000",123456789.toStringAsFixed(4));
  Expect.equals("123456789.00000",123456789.toStringAsFixed(5));
  Expect.equals("123456789.000000",123456789.toStringAsFixed(6));
  Expect.equals("123456789.0000000",123456789.toStringAsFixed(7));
  Expect.equals("123456789.00000000",123456789.toStringAsFixed(8));
  Expect.equals("123456789.000000000",123456789.toStringAsFixed(9));
  Expect.equals("123456789.0000000000",123456789.toStringAsFixed(10));
}
