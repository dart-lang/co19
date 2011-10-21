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

  Expect.approxEquals(double.INFINITY, 0, double.INFINITY);
  Expect.approxEquals(double.INFINITY, 0, double.INFINITY, "");
  Expect.approxEquals(double.INFINITY, 0, double.INFINITY, "not empty");

  Expect.approxEquals(double.NEGATIVE_INFINITY, 0, double.INFINITY);
  Expect.approxEquals(double.NEGATIVE_INFINITY, 0, double.INFINITY, "");
  Expect.approxEquals(double.NEGATIVE_INFINITY, 0, double.INFINITY, "not empty");

  Expect.approxEquals(double.INFINITY, MAX_DOUBLE, double.INFINITY);
  Expect.approxEquals(double.INFINITY, MAX_DOUBLE, double.INFINITY, "");
  Expect.approxEquals(double.INFINITY, MAX_DOUBLE, double.INFINITY, "not empty");

  Expect.approxEquals(double.NEGATIVE_INFINITY, MAX_DOUBLE, double.INFINITY);
  Expect.approxEquals(double.NEGATIVE_INFINITY, MAX_DOUBLE, double.INFINITY, "");
  Expect.approxEquals(double.NEGATIVE_INFINITY, MAX_DOUBLE, double.INFINITY, "not empty");

  Expect.approxEquals(double.INFINITY, NEG_MAX_DOUBLE, double.INFINITY);
  Expect.approxEquals(double.INFINITY, NEG_MAX_DOUBLE, double.INFINITY, "");
  Expect.approxEquals(double.INFINITY, NEG_MAX_DOUBLE, double.INFINITY, "not empty");

  Expect.approxEquals(double.NEGATIVE_INFINITY, NEG_MAX_DOUBLE, double.INFINITY);
  Expect.approxEquals(double.NEGATIVE_INFINITY, NEG_MAX_DOUBLE, double.INFINITY, "");
  Expect.approxEquals(double.NEGATIVE_INFINITY, NEG_MAX_DOUBLE, double.INFINITY, "not empty");
}
