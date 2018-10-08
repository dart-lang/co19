/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num operator +(num other)
 * This operator implements arithmetic addition operation.
 * @description Checks that this operator returns correct value for both integer 
 * and double arguments (including special values).
 * @author vasya
 */
import "../../../Utils/expect.dart";
import "dart:math" as Math;

main() {
  Expect.equals(2, 1 + 1);
  Expect.equals(2147483648, 2147483647 + 1);
  Expect.equals(-2147483647, -2147483648 + 1);
  Expect.equals(4294967296, 4294967295 + 1);
  Expect.equals( -4294967295, -4294967296 + 1);
  Expect.equals(-8301034833169298229, 9223372036854775807 + 922337203685477580);
  Expect.equals(-1, -9223372036854775808 + 9223372036854775807);

  final double MIN_DOUBLE = Math.pow(2.0, -1074);
  final double NEG_MIN_DOUBLE = -1 * MIN_DOUBLE; 
  final double MAX_DOUBLE = (2 - Math.pow(2.0, -52)) * Math.pow(2.0, 1023);
  final double NEG_MAX_DOUBLE = -1 * MAX_DOUBLE; 

  Expect.equals(0.0, 0 + 0.0);
  Expect.equals(0.0, 0 + -0.0);
  Expect.equals(0.0, 1 + -1.0);
  Expect.equals(0.0, -1 + 1.0);

  Expect.equals(double.infinity, 0 + double.infinity);
  Expect.equals(double.infinity, 0 + double.infinity);
  Expect.equals(MIN_DOUBLE, 0 + MIN_DOUBLE);
  Expect.equals(NEG_MIN_DOUBLE, 0 + NEG_MIN_DOUBLE);
  Expect.equals(MAX_DOUBLE, 0 + MAX_DOUBLE);
  Expect.equals(NEG_MAX_DOUBLE, 0 + NEG_MAX_DOUBLE);
  
  Expect.isTrue((0 + double.nan).isNaN);
}
