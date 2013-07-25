/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void notEquals(var unexpected, var actual, [String reason = null])
 * Checks whether the unexpected and actual values are not equal (using [:!=:]).
 * @description Checks that using equal arguments results in ExpectException
 *              being thrown. Arguments being tested include boolean, numeric and
 *              Object, along with null, empty and non-empty reason arguments.
 * @author rodionov
 * @reviewer varlax
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
  } on ExpectException catch(ok) {
  }
}
