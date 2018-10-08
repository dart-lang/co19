/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */

library Expect;
import "dart:async";
part "../../Utils/expect_common.dart";
part "../../Utils/async_utils.dart";

const String testSuiteRoot="/root_dart/tests/co19/src/WebPlatformTest";

/**
 * some functions from harness.js ported 
 */

 void _fail(String message) {
    throw new ExpectException(message);
 }

void assert_equals(var actual, var expected, [String diag]) {
  Expect.equals(expected, actual, diag);
}

void assert_not_equals(var actual, var expected, [String diag]) {
  Expect.notEquals(expected, actual, diag);
}

void assert_true(var actual, [String diag]) {
  Expect.isTrue(actual, diag);
}

void assert_false(var actual, [String diag]) {
  Expect.isFalse(actual, diag);
}

void assert_throws(String expectedExceptionName, void f(), [String diag]) {
  Expect.throws(f, (e) => e.toString().contains(expectedExceptionName), diag);
}

void assert_array_equals(var actual, var expected, [String diag]) {
  Expect.listEquals(expected, actual, diag);
}

void assert_class_string(var object, String expected, [String diag]) {
  String actual = object.runtimeType.toString();
  if (expected == actual) return;
  String msg = (diag == null) ? "" : ", '$diag'";
  _fail("assert_class_string(expected: <$expected>, actual: <$actual>$msg) fails.");
}

void assert_in_array(var actual, List expected, String description) {
   Expect.isTrue(expected.indexOf(actual) != -1, description);
}

int passcnt = 0;
int failcnt = 0;
String failures = "";

void test(void func(), String name, [properties]) {
  try {
    func();
    passcnt++;
  } catch (exc) {
    failcnt++;
    failures = "$failures\nTest failed: $name\n$exc\n";
  }
}

void checkTestFailures() {
  print("tests passed: $passcnt; failed: $failcnt");
  if (failcnt == 0) return;
  _fail(failures);
}


/*
 * Convert a value to a nice, human-readable string
 */
String format_value(val) {
  return val.toString(); // TODO
}


/** if async tests are present, use this function instead of checkTestFailures
 */
void checkAsyncTestFailures() {
  asyncCompleted.then((n){checkTestFailures();});
}

void generate_tests(Function func, List args) {
    for (List x in args) {
        var name = x[0];
        test(() {
           Function.apply(func, x.sublist(1));
        }, 
        name);
     }
}
