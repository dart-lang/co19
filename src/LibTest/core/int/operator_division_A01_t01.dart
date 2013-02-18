/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This operator implements the arithmetic division operation.
 * @description Checks that this operator returns correct value.
 * @author vasya
 * @needsreview 2^80 / 2^50 should give accurate result, but due to the 
 * fact that result of division is double it doesn't
 * @reviewer msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";
 
import "dart:math" as Math;

// the gap between this double and the next
// @3rdparty sputnik-v1/lib/math_precision.js
double getPrecision(num number) {
  var log2num = Math.log(number.abs()) / Math.LN2;
  double pernum = log2num.ceil();
  return(Math.pow(2, -51 + pernum));
}

main() {
  Expect.equals(1.0,  1 / 1);
  Expect.equals(-1.0, 1 / -1);
  
  Expect.equals(0.5,  1 / 2);

  Expect.equals(0.0, 0 / 2);
  Expect.equals(0.0, 0 / 1);

  Expect.equals(-1.5, (-3) / 2);

  Expect.equals(1.0, 2147483647 / 2147483647);

  Expect.equals(9223372036854775808.0, 18446744073709551616 / 2);
  Expect.equals(-9223372036854775808.0, 18446744073709551616 / -2);
  Expect.equals(2.0, 18446744073709551616 / 9223372036854775808);
  
  // 2^80 / 2^50
  Expect.equals(1073741824.0, 1208925819614629174706176 / 1125899906842624);
  
  // 3^80 / 2^80
  double expRes = 122264598055704.6356847831861806640815075;
  double actRes = 147808829414345923316083210206383297601 / 1208925819614629174706176;
  Expect.isTrue((actRes - expRes).abs() <= getPrecision(expRes));
}
