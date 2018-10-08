library testharness_top;

import "dart:html";
export "dart:html";
import "../Utils/expect.dart";
export "../Utils/expect.dart";
export "resources/testharness.dart";

const String testSuiteRoot="/root_dart/tests/co19/src/LayoutTests";
const NaN=double.nan;
const Infinity=double.infinity;
var HtmlNamespace = 'http://www.w3.org/1999/xhtml';
var SvgNamespace = "http://www.w3.org/2000/svg";
var XlinkNamespace = "http://www.w3.org/1999/xlink";

class NullTreeSanitizer implements NodeTreeSanitizer {
    void sanitizeTree(Node node) {}
}

int passcnt = 0;
int failcnt = 0;
bool printPassed=false;

void testPassed(String testName) {
    passcnt++;
    if (printPassed) {
        print('test "$testName" passed.');
    }
}

void testFailed(String testName, [String diag]) {
    failcnt++;
    if (diag == null) {
        diag=".";
    } else {
        diag=": $diag.";
    }
    print('test "$testName" failed$diag');
}

void shouldBe(actual, expected, [reason]) {
  try {
      Expect.equals(expected, actual, reason); // it checks for NaNs
      testPassed("shouldBe($actual, $expected, $reason)");
  } catch (e) {
      testFailed("shouldBe($actual, $expected, $reason)");
  }
}

void shouldBeFalse(bool expr, [reason]) {
  try {
      Expect.isFalse(expr, reason); // it checks for NaNs
      passcnt++;
  } catch (e) {
      failcnt++;
      print("shouldBeFalse($expr, $reason) failed.");
  }
}

void shouldBeTrue(bool expr, [reason]) {
  try {
      Expect.isTrue(expr, reason); // it checks for NaNs
      passcnt++;
  } catch (e) {
      failcnt++;
      print("shouldBeFalse($expr, $reason) failed.");
  }
}

void test(void func(), String testName, [properties]) {
  try {
    func();
    testPassed(testName);
  } catch (exc) {
    testFailed(testName, exc.toString());
  }
}

void shouldThrow(void func(), [bool check(exception), reason]) {
    test((){
       Expect.throws(func, check, reason);
    }, reason);
/*
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
    */
}

void checkTestFailures() {
  if (failcnt == 0) {
      print("all $passcnt tests passed.");
  } else {
      Expect.fail("tests passed: $passcnt; failed: $failcnt");
  }
}

void description(String descr) {
    document.body.appendHtml(descr, treeSanitizer:new NullTreeSanitizer());
}

var reason;

debug(msg) {
  msg = msg.toString();
  print(msg);
  var x = document.getElementById('console');
  if (x != null) {
    var span = document.createElement("span");
    span.setInnerHtml(msg + '<br />', treeSanitizer:new NullTreeSanitizer());
    x.append(span);
  }
  reason = msg;
}
