/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsFixed(int fractionDigits)
 * Returns a decimal-point string-representation of this.
 *...
 * If the absolute value of this is greater or equal to 10^21 then this methods
 * returns an exponential representation computed by
 * this.toStringAsExponential(). Otherwise the result is the closest string
 * representation with exactly fractionDigits digits after the decimal point
 * @description Checks that If the absolute value of this is greater or equal
 * to 10^21 then this methods returns an exponential representation computed by
 * this.toStringAsExponential().
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:math";

main() {
  int y = pow(10, 18);
  Expect.equals("1000000000000000000", y.toStringAsFixed(0));
  Expect.equals("1000000000000000000.0000000000", y.toStringAsFixed(10));
  Expect.equals("1000000000000000000.00000000000000000000", y.toStringAsFixed(20));
}
