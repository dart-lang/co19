/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void notEquals(var unexpected, var actual, [String reason = null])
 * Descriptive error message is provided in case of failure.
 * @description Checks that message of thrown ExpectException includes 
 *              representation of the unexpected and actual values, as well as the reason.
 * @author varlax
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  check(0, 0);
  check(0, 0, "");
  check(0x80000000, 0x80000000, "not empty");

  check(null, null);
  check(null, null, "");
  check(null, null, "not empty");

  check(true, true);
  check(false, false, "");
  check(false, false, "not empty");

  Object foo = new Object();
  check(foo, foo);
  check(foo, foo, "");
  check(foo, foo, "not empty");

  check("", "", "bla");
}

void check(var arg1, var arg2, [String reason = null]) {
  try {
    Expect.notEquals(arg1, arg2, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
    if (!e.message.contains(arg1 != null ? arg1.toString() : "null", 0)) throw "no unexpected value";
    if (!e.message.contains(arg2 != null ? arg2.toString() : "null", 0)) throw "no actual value";
    if (reason != null && !reason.isEmpty && !e.message.contains(reason, 0)) throw "no reason";
  }
}
