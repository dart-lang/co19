/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void equals(var expected, var actual, [String reason = null])
 * Descriptive error message is provided in case of failure.
 * @description Checks that message of thrown ExpectException includes 
 *              representation of the expected and actual values, as well as the reason.
 * @author varlax
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  check(0, null);
  check(0, null, "");
  check(0, null, "not empty");

  check(null, 0);
  check(null, 0, "");
  check(null, 0, "not empty");

  check(false, new Object());
  check(new Object(), true, "");
  check(1, true, "not empty");

  check(null, false);
}

void check(var arg1, var arg2, [String reason = null]) {
  try {
    Expect.equals(arg1, arg2, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
    if (!e.message.contains(arg1 != null ? arg1.toString() : "null", 0)) throw "no expected value";
    if (!e.message.contains(arg2 != null ? arg2.toString() : "null", 0)) throw "no actual value";
    if (reason != null && !reason.isEmpty && !e.message.contains(reason, 0)) throw "no reason";
  }
}
