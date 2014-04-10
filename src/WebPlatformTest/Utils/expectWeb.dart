// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library Expect;
part "../../Utils/expect_common.dart";

/**
 * Expect is used for tests that do not want to make use of the
 * Dart unit test library - for example, the core language tests.
 * Third parties are discouraged from using this, and should use
 * the expect() function in the unit test library instead for
 * test assertions.
 */

 void _fail(String message) {
    throw new ExpectException(message);
 }

void assert_equals(var actual, var expected, [String diag]) {
  Expect.equals(expected, actual, diag);
}

void assert_true(var actual, [String diag]) {
  Expect.isTrue(actual, diag);
}

void assert_false(var actual, [String diag]) {
  Expect.isFalse(actual, diag);
}

void assert_throws(String expectedExceptionName, var function, [String diag]) {
  Expect.throws(function, (e)=>e.toString().contains(expectedExceptionName), diag);
}

void assert_array_equals(var actual, var expected, [String diag]) {
  Expect.listEquals(expected, actual, diag);
}

