/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void approxEquals(num expected, num actual, [num tolerance = null, String reason = null])
 * Passing null as either expected or actual results in NullPointerException. 
 * @description Checks that NullPointerException is thrown if any of the required arguments are null.
 * @author rodionov
 * @reviewer varlax
 * @needsreview Undocumented
 */

main() {
  check(null, 0);
  check(null, 0, reason:"");
  check(null, 0, reason:"not empty");

  check(0, null);
  check(0, null, reason: "");
  check(0, null, reason: "not empty");

  check(null, null);
  check(null, null, reason: "");
  check(null, null, reason: "not empty");

  check(null, 0, 0);
  check(null, 0, 0, "");
  check(null, 0, 0, "not empty");

  check(0, null, 0);
  check(0, null, 0, "");
  check(0, null, 0, "not empty");

  check(null, null, 0);
  check(null, null, 0, "");
  check(null, null, 0, "not empty");
}

void check(num arg1, num arg2, [num tolerance = null, String reason = null]) {
  try {
    Expect.approxEquals(arg1, arg2, tolerance, reason);
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(e) {
  }
}
