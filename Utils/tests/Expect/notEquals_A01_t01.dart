/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void notEquals(var unexpected, var actual, [String reason = null])
 * Checks whether the unexpected and actual values are not equal (using [:!=:]).
 * @description Checks that no exception is thrown when the arguments are not equal,
 *              regardless of reason (the last argument). Null, numeric and Object values are tested.
 * @author rodionov
 * @reviewer varlax
 * @needsreview Undocumented
 */
import "../../../Utils/expect.dart";

main() {
  Expect.notEquals(0, null);
  Expect.notEquals(0, null, "");
  Expect.notEquals(0, null, "not empty");

  Expect.notEquals(null, 0);
  Expect.notEquals(null, 0, "");
  Expect.notEquals(null, 0, "not empty");
  
  Expect.notEquals(false, new Object());
  Expect.notEquals(new Object(), true, "");
  Expect.notEquals(1, true, "not empty");

  Expect.notEquals(null, false);
  Expect.notEquals(true, false);
}
