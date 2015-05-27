/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Core/test_boolean_expr.html
 * @description 
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../../../testcommon.dart";

int passcnt=0;
int failcnt=0;
String failures="";

void checkTestFailures() {
  print("tests passed: $passcnt; failed: $failcnt");
  if (failcnt==0) return;
  Expect.fail(failures);
}

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();

    Document doc = (new DomParser()).parseFromString("<root num0='0' num2='2' num4='4'><egg1>egg1</egg1><egg2>egg2</egg2></root>", "application/xml");

    void test(String expr, bool expected) {
        var nodeset = evaluator.evaluate(expr, doc, null, XPathResult.BOOLEAN_TYPE, null);
        bool actual=nodeset.booleanValue;
        if (actual==expected) {
            passcnt++;
        } else {
            failcnt++;
            failures="$failures\ntest($expr) failed: expected length=$expected, actual=$actual.";
        }
    }
    
    test("3.14 < -4", false);
    test("3.14 <= -4", false);
    test("3.14 > -4", true);
    test("3.14 >= 3.14", true);
    test("number(\'NaN\') < -4", false);
    test("number(\'NaN\') <= -4", false);
    test("number(\'NaN\') > -4", false);
    test("number(\'NaN\') >= 3.14", false);
    test("/root/@num2 <= /root/@num2", true);
    test("/root/@num2 >= /root/@num2", true);
    test("/root/@num0 <= /root/@num2", true);
    test("/root/@num0 >= /root/@num2", false);
    test("/root/@num4 <= /root/@num2", false);
    test("/root/@num4 >= /root/@num2", true);
    
    test("\'3.14\' = \'3.14\'", true);
    test("\'3.14\' = \'Hi\'", false);
    test("\'3.14\' != -4", true);
    test("number(\'NaN\') = \'Hi\'", false);
    test("number(\'NaN\') != -4", true);
    test("number(\'NaN\')  = number(\'NaN\')", false);
    test("number(\'NaN\') != number(\'NaN\')", true);
    test("/empty  = true()", false);
    test("/empty != true()", true);
    test("/empty  = false()", true);
    test("/empty != false()", false);
    test("/empty  = /root/*[1]", false);
    test("/empty != /root/*[1]", false);
    test("/root/*[1]  = /empty", false);
    test("/root/*[1] != /empty", false);
    test("/root/*[1]  = /root/*[1]", true);
    test("/root/*[1] != /root/*[1]", false);
    test("\'egg1\'  = /root/*[1]", true);
    test("\'egg1\' != /root/*[1]", false);
    test("\'egg2\'  = /root/*[1]", false);
    test("\'egg2\' != /root/*[1]", true);
    test("\'egg1\'  = /root/*", true);
    // Yeah, non-intuitive, but true acc to XPath spec 3.4
    test("\'egg1\' != /root/*", true);
    
    test("true() and true()", true);
    test("true() and false()", false);
    test("false() and true()", false);
    test("false() and false()", false);
    test("true() or false()", true);
    test("false() or true()", true);
    test("true() or true()", true);
    test("false() or false()", false);
    
    checkTestFailures();
}