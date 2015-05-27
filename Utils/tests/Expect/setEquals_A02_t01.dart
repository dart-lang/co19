/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void setEquals(Iterable expected, Iterable actual, [String reason = null])
 * Passing null as either expected or actual results in Error. 
 * @description Checks that Error is thrown if any of the required arguments are null.
 * @author rodionov
 * @reviewer varlax
 * @needsreview Undocumented
 */
import "../../../Utils/expect.dart";

main() {
  check(null, []);
  check(null, [], "");
  check(null, [], "not empty");

  check([], null);
  check([], null, "");
  check([], null, "not empty");

  check(null, null);
  check(null, null, "");
  check(null, null, "not empty");
}

void check(Iterable arg1, Iterable arg2, [String reason = null]) {
  try {
    Expect.setEquals(arg1, arg2, reason);
    Expect.fail("Error expected");
  } on Error catch(e) {
  }
}
