/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void throws(void f(), [_CheckExceptionFn check = null, String reason = null])
 * typedef bool _CheckExceptionFn(exception)
 * Calls the function [f] and verifies that it throws an exception.
 * The optional [check] function can provide additional validation that the correct exception is being thrown.
 * @description Checks that if the tested method doesn't throw an exception, this method fails
 * regardless of whether the validating function is null, returns true or false and whether the reason is null.
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

typedef bool checkFn(exception);

void badboy() {
  return;
}

main() {
  check(badboy);
  check(badboy, null, "");
  check(badboy, null, "not empty");

  check(badboy, (e) => true);
  check(badboy, (e) => true, "");
  check(badboy, (e) => true, "not empty");

  check(badboy, (e) => false);
  check(badboy, (e) => false, "");
  check(badboy, (e) => false, "not empty");
}

void check(void f(), [checkFn ch = null, String reason = null]) {
  try {
    Expect.throws(f, ch, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
  }
}
