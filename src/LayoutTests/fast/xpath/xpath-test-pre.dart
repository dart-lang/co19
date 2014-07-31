import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";


int passcnt=0;
int failcnt=0;
String failures="";

void checkTestFailures() {
  print("tests passed: $passcnt; failed: $failcnt");
  if (failcnt==0) return;
  Expect.fail(failures);
}

void checkSnapshot(comment, actual, expected) {
    if (actual.snapshotLength != expected.length) {
        testFailed("$comment: incorrect length (expected ${expected.length}, actual ${actual.snapshotLength})");
        print("$comment: incorrect length (expected ${expected.length}, actual ${actual.snapshotLength})");
        return;
    }
    
    for (int i = 0; i < actual.snapshotLength; ++i) {
        if (actual.snapshotItem(i) != expected[i]) {
            testFailed("$comment: $item $i  incorrect (expected ${expected[i].nodeName}, actual ${actual.snapshotItem(i).nodeName})");
            print("$comment: $item $i  incorrect (expected ${expected[i].nodeName}, actual ${actual.snapshotItem(i).nodeName})");
            return;
        }
    }
    
    testPassed(comment);
}

void test(doc, context, String expr, expected, nsResolver) {
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
                    testFailed(expr + ": expected " + expected + ", actual " + result.numberValue);
            } else if (expected is String) {
                if (result.stringValue == expected)
                    testPassed(expr);
                else
                    testFailed(expr + ": expected '" + expected + "', actual '" + result.stringValue + "'");
            } else if (expected is bool) {
                if (result.booleanValue == expected)
                    testPassed(expr);
                else
                    testFailed(expr + ": expected '" + expected + "', actual '" + result.booleanValue + "'");
            }
        }
        passcnt++;
    } catch (ex) {
//        Expect.fail("$expr: raised $ex");
        failcnt++;
        failures="$failures\ntest($expr) raised $ex";
    }
}
