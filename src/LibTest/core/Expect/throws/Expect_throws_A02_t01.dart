/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void throws(void f(), [_CheckExceptionFn check = null, String reason = null])
 * typedef bool _CheckExceptionFn(exception)
 * Passing null as the first argument results in NullPointerException. 
 * @description Checks that NullPointerException is thrown if the first argument is null.
 * @author rodionov
 * @reviewer varlax
 * @needsreview Undocumented
 */

typedef bool checkFn(exception);

main() {
  check();
  check(reason: "");
  check(reason: "not empty");

  check((e) => true);
  check((e) => true, "");
  check((e) => true, "not empty");

  check((e) => false);
  check((e) => false, "");
  check((e) => false, "not empty");
}

void check([checkFn check = null, String reason = null]) {
  try {
    Expect.throws(null, check, reason);
    Expect.fail("NullPointerException expected");
  } catch (NullPointerException e) {
  }
}
