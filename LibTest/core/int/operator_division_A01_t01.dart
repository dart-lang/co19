/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator /(num other)
 * This operator implements the arithmetic division operation.
 * @description Checks that this operator returns correct value.
 * @author vasya
 */
import "../../../Utils/expect.dart";
import "dart:math" as Math;

// the gap between this double and the next
// @3rdparty sputnik-v1/lib/math_precision.js
double getPrecision(num number) {
  var log2num = Math.log(number.abs()) / Math.ln2;
  int pernum = log2num.ceil();
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

  Expect.equals(922337203685477600.0, 1844674407370955161 / 2);
  Expect.equals(-922337203685477600.0, 1844674407370955161 / -2);
  Expect.equals(2.0, 1844674407370955161 / 922337203685477580);
}
