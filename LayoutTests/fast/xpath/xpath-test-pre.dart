library xpath_test_pre;

import "dart:html";
import "../../../Utils/expect.dart";

const NaN=double.nan;

int passcnt=0;
int failcnt=0;

void testPassed(String testName) {
    passcnt++;
//    print("test $testName passed.");
}

void testFailed(String testName, String diag) {
    failcnt++;
    print("test $testName failed:$diag.");
}

void shouldBe(actual, expected, [reason]) {
  try {
      Expect.equals(expected, actual, reason); // it checks for NaNs      
      passcnt++;
//      print("shouldBe($actual, $expected, $reason) passed.");
  } catch (e) {
      failcnt++;
      print("shouldBe($actual, $expected, $reason) failed.");
  }
}

void checkTestFailures() {
  if (failcnt==0) {
      print("all $passcnt tests passed.");
  } else {
      Expect.fail("tests passed: $passcnt; failed: $failcnt");
  }
}

void checkSnapshot(String testName, XPathResult actual, List expected) {
    if (actual.snapshotLength != expected.length) {
        testFailed(testName, "incorrect length (expected ${expected.length}, actual ${actual.snapshotLength})");
        return;
    }
    
    for (int i = 0; i < actual.snapshotLength; ++i) {
        if (actual.snapshotItem(i) != expected[i]) {
            testFailed(testName, "item $i  incorrect (expected ${expected[i].nodeName}, actual ${actual.snapshotItem(i).nodeName})");
            return;
        }
    }
    
    testPassed(testName);
}

void test(doc, context, String expr, expected, [nsResolver]) {
    XPathEvaluator evaluator=new XPathEvaluator();
    try {
        if (context is String)
            context = evaluator.evaluate(context, doc.documentElement, nsResolver, XPathResult.ANY_UNORDERED_NODE_TYPE, null).singleNodeValue;
        if (!(expected is num || expected is String || expected is bool)) {
            var result = evaluator.evaluate(expr, context, nsResolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
            checkSnapshot(expr,  result, expected);
        } else {
            var result = evaluator.evaluate(expr, context, nsResolver, XPathResult.ANY_TYPE, null);
            if (expected is num) {
                if (result.numberValue == expected)
                    testPassed(expr);
                else
                    testFailed(expr, "expected $expected actual ${result.numberValue}");
            } else if (expected is String) {
                if (result.stringValue == expected)
                    testPassed(expr);
                else
                    testFailed(expr, "expected '$expected', actual '${result.stringValue}'");
            } else if (expected is bool) {
                if (result.booleanValue == expected)
                    testPassed(expr);
                else
                    testFailed(expr, "expected '$expected', actual '${result.booleanValue}'");
            }
        }
        testPassed(expr);
    } catch (ex) {
        testFailed(expr, "raised $ex");
    }
}

void shouldThrow(func(), [check, reason]) {
    try {
      func();
      String msg = reason == null ? "" : reason;
      testFailed('Expect.throws($msg)', "no exception");
    } catch (e, s) {
      if ((check != null) && !check(e)) {
        String msg = reason == null ? "" : reason;
        testFailed("Expect.throws($msg)", "Unexpected ${e.runtimeType}('$e')\n$s");
      } else {
        String msg = reason == null ? "" : reason;
        testPassed(msg);
      }
    }
  }

