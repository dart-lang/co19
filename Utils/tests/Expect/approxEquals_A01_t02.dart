/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void approxEquals(num expected, num actual, [num tolerance = null, String reason = null])
 * Failure if the difference between expected and actual is greater than the given tolerance. 
 * @description Checks that using arguments with (non-NAN) difference exceeding the specified 
 * non-negative, non-NAN tolerance always results in failure.
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  final double MIN_DOUBLE = Math.pow(2.0, -1074);
  final double NEG_MIN_DOUBLE = -1 * MIN_DOUBLE; 
  final double MAX_DOUBLE = (2 - Math.pow(2.0, -52)) * Math.pow(2.0, 1023);
  final double NEG_MAX_DOUBLE = -1 * MAX_DOUBLE; 

  check(100.0, 101, 0.1);
  check(100.0, 101, 0.2, "");
  check(100.0, 101, 0.3, "not empty");

  check(101, 100.0, 0);
  check(101, 100.0, 0, "");
  check(101, 100.0, 0, "not empty");

  check(100.0, 101, 0.0);
  check(100.0, 101, 0.0, "");
  check(100.0, 101, 0.0, "not empty");

  check(double.infinity, 0, MAX_DOUBLE);
  check(double.infinity, 0, MAX_DOUBLE, "");
  check(double.infinity, 0, MAX_DOUBLE, "not empty");

  check(double.negativeInfinity, 0, MAX_DOUBLE);
  check(double.negativeInfinity, 0, MAX_DOUBLE, "");
  check(double.negativeInfinity, 0, MAX_DOUBLE, "not empty");

  check(double.infinity, MAX_DOUBLE, MAX_DOUBLE);
  check(double.infinity, MAX_DOUBLE, MAX_DOUBLE, "");
  check(double.infinity, MAX_DOUBLE, MAX_DOUBLE, "not empty");

  check(double.negativeInfinity, MAX_DOUBLE, MAX_DOUBLE);
  check(double.negativeInfinity, MAX_DOUBLE, MAX_DOUBLE, "");
  check(double.negativeInfinity, MAX_DOUBLE, MAX_DOUBLE, "not empty");

  check(double.infinity, NEG_MAX_DOUBLE, MAX_DOUBLE);
  check(double.infinity, NEG_MAX_DOUBLE, MAX_DOUBLE, "");
  check(double.infinity, NEG_MAX_DOUBLE, MAX_DOUBLE, "not empty");

  check(double.negativeInfinity, NEG_MAX_DOUBLE, MAX_DOUBLE);
  check(double.negativeInfinity, NEG_MAX_DOUBLE, MAX_DOUBLE, "");
  check(double.negativeInfinity, NEG_MAX_DOUBLE, MAX_DOUBLE, "not empty");
}

void check(num arg1, num arg2, num tolerance, [String reason = null]) {
  try {
    Expect.approxEquals(arg1, arg2, tolerance, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
  }
}
