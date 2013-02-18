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
 * @description Checks that if the tested method throws an exception, this method fails only if the validating
 * function is not null and returns false, regardless of whether the specified reason is null or not.
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

typedef bool checkFn(exception);

void goodboy() {
  throw new Exception("");
}

main() {
  Expect.throws(goodboy);
  Expect.throws(goodboy, null, "");
  Expect.throws(goodboy, null, "not empty");

  Expect.throws(goodboy, (e) => true);
  Expect.throws(goodboy, (e) => true, "");
  Expect.throws(goodboy, (e) => true, "not empty");

  check(goodboy, (e) => false);
  check(goodboy, (e) => false, "");
  check(goodboy, (e) => false, "not empty");
}

void check(void f(), [checkFn ch = null, String reason = null]) {
  try {
    Expect.throws(f, ch, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
  }
}
