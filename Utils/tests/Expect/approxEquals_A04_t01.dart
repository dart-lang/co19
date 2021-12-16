// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void approxEquals(num expected, num actual, [
///   num tolerance = null, String reason = null])
/// Descriptive error message is provided in case of failure.
///
/// @description Checks that message of thrown [ExpectException] includes
/// representation of the expected, actual and tolerance values, as well as the
/// reason.
/// @author varlax

import "../../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  final double MIN_DOUBLE = Math.pow(2.0, -1074) as double;
  final double NEG_MIN_DOUBLE = -1 * MIN_DOUBLE; 
  final double MAX_DOUBLE =
      (2 - Math.pow(2.0, -52)) * Math.pow(2.0, 1023) as double;
  final double NEG_MAX_DOUBLE = -1 * MAX_DOUBLE; 

  // min double > 0 / 10000
  check(0, MIN_DOUBLE);
  check(0, MIN_DOUBLE, null, "");
  check(0, MIN_DOUBLE, null, "not empty");

  check(0, NEG_MIN_DOUBLE);
  check(0, NEG_MIN_DOUBLE, null, "");
  check(0, NEG_MIN_DOUBLE, null, "not empty");

  check(MAX_DOUBLE, double.infinity);
  check(double.nan, double.negativeInfinity);

  check(20, 2, 1);
  check(MIN_DOUBLE, MAX_DOUBLE, 123, "sddsd");
  check(0, -0.0, double.nan, "");
}

void check(num arg1, num arg2, [num? tol = null, String reason = '']) {
  try {
    Expect.approxEquals(arg1, arg2, tol, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
    if(e.message == null) throw "message is null";
    String msg = e.message as String;
    if (!msg.contains(arg1.toString(), 0)) throw "no expected value";
    if (!msg.contains(arg2.toString(), 0)) throw "no actual value";
    if (!reason.isEmpty && !msg.contains(reason, 0)) throw "no reason";
    tol ??= (arg1 / Math.pow(10.0, 4.0)).abs();
    if (!msg.contains(tol.toString(), 0)) throw "no tolerance";
  }
}
