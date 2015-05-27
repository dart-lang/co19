/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void approxEquals(num expected, num actual, [num tolerance = null, String reason = null])
 * Failure if the difference between expected and actual is greater than the given tolerance. 
 * @description Checks that using negative tolerance (except negative zero) or NAN as either argument always results in failure.
 * Negative tolerances tested include doubles of minimum and maximum possible magnitude.
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

  check(0, 0, double.NEGATIVE_INFINITY);
  check(0, 0, double.NEGATIVE_INFINITY, "");
  check(0, 0, double.NEGATIVE_INFINITY, "not empty");

  check(0, 0, NEG_MAX_DOUBLE);
  check(0, 0, NEG_MAX_DOUBLE, "");
  check(0, 0, NEG_MAX_DOUBLE, "not empty");

  check(0, 0, NEG_MIN_DOUBLE);
  check(0, 0, NEG_MIN_DOUBLE, "");
  check(0, 0, NEG_MIN_DOUBLE, "not empty");

  // inf - inf -> NaN
  check(double.INFINITY, double.INFINITY, double.INFINITY);
  check(double.INFINITY, double.INFINITY, double.INFINITY, "");
  check(double.INFINITY, double.INFINITY, double.INFINITY, "not empty");

  check(double.NEGATIVE_INFINITY, double.NEGATIVE_INFINITY, double.INFINITY);
  check(double.NEGATIVE_INFINITY, double.NEGATIVE_INFINITY, double.INFINITY, "");
  check(double.NEGATIVE_INFINITY, double.NEGATIVE_INFINITY, double.INFINITY, "not empty");

  check(0, double.NAN, double.INFINITY);
  check(0, double.NAN, double.INFINITY, "");
  check(0, double.NAN, double.INFINITY, "not empty");

  check(0, 0, double.NAN);
  check(0, 0, double.NAN, "");
  check(0, 0, double.NAN, "not empty");
}

void check(num arg1, num arg2, num tolerance, [String reason = null]) {
  try {
    Expect.approxEquals(arg1, arg2, tolerance, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
  }
}
