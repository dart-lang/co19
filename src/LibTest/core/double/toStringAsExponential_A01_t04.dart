import "../../../Utils/expect.dart";
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 /**
 * @assertion String toStringAsExponential(int fractionDigits)
 * @description Checks return values for maximum and minimum doubles.
 * @author msyabro
 */

main() {
  var max = 1.7976931348623157e308;
  var min = 2.2250738585072014e-308;
  var minSubnormal = 4.9406564584124654e-324;

  Expect.equals('2e+308', max.toStringAsExponential(0));
  Expect.equals('1.8e+308', max.toStringAsExponential(1));
  Expect.equals('1.80e+308', max.toStringAsExponential(2));
  Expect.equals('1.798e+308', max.toStringAsExponential(3));
  Expect.equals('1.7977e+308', max.toStringAsExponential(4));
  Expect.equals('1.79769e+308', max.toStringAsExponential(5));

  Expect.equals('2e-308', min.toStringAsExponential(0));
  Expect.equals('2.2e-308', min.toStringAsExponential(1));
  Expect.equals('2.23e-308', min.toStringAsExponential(2));
  Expect.equals('2.225e-308', min.toStringAsExponential(3));
  Expect.equals('2.2251e-308', min.toStringAsExponential(4));
  Expect.equals('2.22507e-308', min.toStringAsExponential(5));

  Expect.equals('5e-324', minSubnormal.toStringAsExponential(0));
  Expect.equals('4.9e-324', minSubnormal.toStringAsExponential(1));
  Expect.equals('4.94e-324', minSubnormal.toStringAsExponential(2));
  Expect.equals('4.941e-324', minSubnormal.toStringAsExponential(3));
  Expect.equals('4.9407e-324', minSubnormal.toStringAsExponential(4));
  Expect.equals('4.94066e-324', minSubnormal.toStringAsExponential(5));
}
