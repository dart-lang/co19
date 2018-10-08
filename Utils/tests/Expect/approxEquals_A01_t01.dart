/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void approxEquals(num expected, num actual, [num tolerance = null, String reason = null])
 * Failure if the difference between expected and actual is greater than the given tolerance. 
 * @description Checks that no exception is thrown when the difference between arguments is equal 
 * to specified non-negative, non-NAN tolerance, regardless of reason (the last argument). Also
 * checks the case when the specified tolerance is negative zero (0.0 == -0.0).
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

  Expect.approxEquals(100.0, 101, 1);
  Expect.approxEquals(100.0, 101, 1, "");
  Expect.approxEquals(100.0, 101, 1, "not empty");

  Expect.approxEquals(101, 100.0, 1);
  Expect.approxEquals(101, 100.0, 1, "");
  Expect.approxEquals(101, 100.0, 1, "not empty");

  Expect.approxEquals(100, 100.0, 0);
  Expect.approxEquals(100, 100.0, 0, "");
  Expect.approxEquals(100, 100.0, 0, "not empty");

  Expect.approxEquals(100, -100.0, 200);
  Expect.approxEquals(100, -100.0, 200, "");
  Expect.approxEquals(100, -100.0, 200, "not empty");

  Expect.approxEquals(-100, 100.0, 200);
  Expect.approxEquals(-100, 100.0, 200, "");
  Expect.approxEquals(-100, 100.0, 200, "not empty");

  Expect.approxEquals(100, 100, -0.0);
  Expect.approxEquals(100, 100, -0.0, "");
  Expect.approxEquals(100, 100, -0.0, "not empty");

  Expect.approxEquals(double.infinity, 0, double.infinity);
  Expect.approxEquals(double.infinity, 0, double.infinity, "");
  Expect.approxEquals(double.infinity, 0, double.infinity, "not empty");

  Expect.approxEquals(double.negativeInfinity, 0, double.infinity);
  Expect.approxEquals(double.negativeInfinity, 0, double.infinity, "");
  Expect.approxEquals(double.negativeInfinity, 0, double.infinity, "not empty");

  Expect.approxEquals(double.infinity, MAX_DOUBLE, double.infinity);
  Expect.approxEquals(double.infinity, MAX_DOUBLE, double.infinity, "");
  Expect.approxEquals(double.infinity, MAX_DOUBLE, double.infinity, "not empty");

  Expect.approxEquals(double.negativeInfinity, MAX_DOUBLE, double.infinity);
  Expect.approxEquals(double.negativeInfinity, MAX_DOUBLE, double.infinity, "");
  Expect.approxEquals(double.negativeInfinity, MAX_DOUBLE, double.infinity, "not empty");

  Expect.approxEquals(double.infinity, NEG_MAX_DOUBLE, double.infinity);
  Expect.approxEquals(double.infinity, NEG_MAX_DOUBLE, double.infinity, "");
  Expect.approxEquals(double.infinity, NEG_MAX_DOUBLE, double.infinity, "not empty");

  Expect.approxEquals(double.negativeInfinity, NEG_MAX_DOUBLE, double.infinity);
  Expect.approxEquals(double.negativeInfinity, NEG_MAX_DOUBLE, double.infinity, "");
  Expect.approxEquals(double.negativeInfinity, NEG_MAX_DOUBLE, double.infinity, "not empty");
}
