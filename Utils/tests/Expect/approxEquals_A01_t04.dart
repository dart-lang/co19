/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void approxEquals(num expected, num actual, [num tolerance = null, String reason = null])
 * Failure if the difference between expected and actual is greater than the given tolerance. 
 * @description Checks that no exception is thrown when the absolute difference between arguments 
 * is strictly less than specified non-negative, non-NAN tolerance, regardless of reason (the last argument).
 * @author rodionov
 * @author varlax
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  final double MIN_DOUBLE = Math.pow(2.0, -1074);
  final double NEG_MIN_DOUBLE = -1 * MIN_DOUBLE; 
  final double MAX_DOUBLE = (2 - Math.pow(2.0, -52)) * Math.pow(2.0, 1023);
  final double NEG_MAX_DOUBLE = -1 * MAX_DOUBLE; 

  Expect.approxEquals(100.0, 101, 1.1);
  Expect.approxEquals(101, 102.1, 2, "");
  Expect.approxEquals(101.0, 100, 1.0000001, "not empty");

  Expect.approxEquals(-101, -100.0, 1.111);
  Expect.approxEquals(-1, 1.0, 3, "");

  Expect.approxEquals(-0.0, 0, 0.111);

  Expect.approxEquals(MAX_DOUBLE, MIN_DOUBLE, MAX_DOUBLE, "not empty");
  Expect.approxEquals(NEG_MAX_DOUBLE, NEG_MIN_DOUBLE, MAX_DOUBLE, "not empty");

  Expect.approxEquals(MAX_DOUBLE, NEG_MAX_DOUBLE, double.infinity);
  Expect.approxEquals(MIN_DOUBLE, NEG_MIN_DOUBLE, 0.0000000001, "");
}
