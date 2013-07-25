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
 * @description Checks that a function being checked can throw arbitrary value, 
 * possibly not assignable to Exception. 
 * Testing with functions that throw null, String and Object.
 * @author rodionov
 * @author varlax
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

typedef bool checkFn(exception);

void badboy() {
  throw "hello!";
}

void badboy2() {
  throw new Object();
}

void badboy3() {
  throw null;
}

main() {
  Expect.throws(badboy);
  Expect.throws(badboy, null,"not empty");

  Expect.throws(badboy, (e) => true);
  check(badboy, (e) => false, "not empty");

  Expect.throws(badboy2);
  Expect.throws(badboy2, (e) => true, "34324");
  check(badboy2, (e) => false);

  Expect.throws(badboy3);
  Expect.throws(badboy3, (e) => e is NullThrownError, "");
  check(badboy3, (e) => false, "not empty");
}

void check(void f(), [checkFn ch = null, String reason = null]) {
  try {
    Expect.throws(f, ch, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
  }
}
