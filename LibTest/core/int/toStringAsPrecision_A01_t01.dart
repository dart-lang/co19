/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsPrecision(int precision)
 * Converts this to a double and returns a string representation with exactly
 * precision significant digits.
 * The parameter precision must be an integer satisfying: 1 <= precision <= 21.
 * @description Checks that this method returns correct value.
 * @author vasya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("1e+8",123456789.toStringAsPrecision(1));
  Expect.equals("1.2e+8",123456789.toStringAsPrecision(2));
  Expect.equals("1.23e+8",123456789.toStringAsPrecision(3));
  Expect.equals("1.235e+8",123456789.toStringAsPrecision(4));
  Expect.equals("1.2346e+8",123456789.toStringAsPrecision(5));
  Expect.equals("1.23457e+8",123456789.toStringAsPrecision(6));
  Expect.equals("1.234568e+8",123456789.toStringAsPrecision(7));
  Expect.equals("1.2345679e+8",123456789.toStringAsPrecision(8));
  Expect.equals("123456789",123456789.toStringAsPrecision(9));
  Expect.equals("123456789.0",123456789.toStringAsPrecision(10));
  
  Expect.equals("0",0.toStringAsPrecision(1));
  Expect.equals("0.0",0.toStringAsPrecision(2));
  Expect.equals("0.00",0.toStringAsPrecision(3));
  Expect.equals("0.000",0.toStringAsPrecision(4));
  Expect.equals("0.0000",0.toStringAsPrecision(5));
  Expect.equals("0.00000",0.toStringAsPrecision(6));
  Expect.equals("0.000000",0.toStringAsPrecision(7));
  Expect.equals("0.0000000",0.toStringAsPrecision(8));
  Expect.equals("0.00000000",0.toStringAsPrecision(9));
  Expect.equals("0.000000000",0.toStringAsPrecision(10));
  
  Expect.equals("1e+1",10.toStringAsPrecision(1));
  Expect.equals("10",10.toStringAsPrecision(2));
  Expect.equals("10.0",10.toStringAsPrecision(3));
  Expect.equals("10.00",10.toStringAsPrecision(4));
  Expect.equals("10.000",10.toStringAsPrecision(5));
  Expect.equals("10.0000",10.toStringAsPrecision(6));
  Expect.equals("10.00000",10.toStringAsPrecision(7));
  Expect.equals("10.000000",10.toStringAsPrecision(8));
  Expect.equals("10.0000000",10.toStringAsPrecision(9));
  Expect.equals("10.00000000",10.toStringAsPrecision(10));
}
