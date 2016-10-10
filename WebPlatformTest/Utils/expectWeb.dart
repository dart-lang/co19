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
  Expect.throws(f, (e)=>e.toString().contains(expectedExceptionName), diag);
}

void assert_array_equals(var actual, var expected, [String diag]) {
  Expect.listEquals(expected, actual, diag);
}

void assert_class_string(var object, String expected, [String diag]) {
  String actual=object.runtimeType.toString();
  if (expected == actual) return;
  String msg = (diag == null) ? "" : ", '$diag'";
  _fail("assert_class_string(expected: <$expected>, actual: <$actual>$msg) fails.");
}

void assert_in_array(List actual, var expected, String description) {
   Expect.isTrue(expected.indexOf(actual) != -1, description);
}

int passcnt=0;
int failcnt=0;
String failures="";

void test(void func(), String name, [properties]) {
  try {
    func();
    passcnt++;
  } catch (exc) {
    failcnt++;
    failures="$failures\nTest failed: $name\n$exc\n";
  }
}

void checkTestFailures() {
  print("tests passed: $passcnt; failed: $failcnt");
  if (failcnt==0) return;
  _fail(failures);
}


/*
 * Convert a value to a nice, human-readable string
 */
String format_value(val) {
  return val.toString(); // TODO
}

/***************** analogue of co19/tests/co19/src/Utils/async_utils.dart: *****/

const ONE_MS = const Duration(milliseconds: 1);

Duration durationMs(delay) {
  return delay == null? Duration.ZERO : ONE_MS * delay;
}

Future runLater(void action(), [int delay=0]) {
  asyncStart();
  return new Future.delayed(durationMs(delay), (){
    action();
    asyncEnd();
  });
}
  
Future runAfter(Future f, void action()) {
  asyncStart();
  return f.whenComplete((){
    action();
    asyncEnd();
  });
}


/**
 * Let the test driver know the test is asynchronous and
 * continues after the method main() exits.  
 * see co19 issue #423
 * http://code.google.com/p/co19/issues/detail?id=423
 */
var _completer = new Completer();
var asyncCompleted = _completer.future;

int _asyncTestStart() {
  print("unittest-suite-wait-for-done");
  return 0;
}

int _asyncCounter=_asyncTestStart();

void  asyncStart() {
  _asyncCounter++;
//  print("asyncStart");
}

void  asyncMultiStart(int delta) {
//  print("asyncMultiStart $delta");
  _asyncCounter+=delta;
}

void  asyncEnd() {
//  print("asyncEnd");
  Expect.isFalse(_asyncCounter==0, "asyncEnd: _asyncCounter==0");
  _asyncCounter--;
  if (_asyncCounter==0) {
    print("unittest-suite-success");
    _completer.complete(null);
  }
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
