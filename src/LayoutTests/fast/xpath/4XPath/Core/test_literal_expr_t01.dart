/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Core/test_literal_expr.html
 * @description 
 */
import "dart:html";
import "../../../../testharness.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    shouldBe(evaluator.evaluate('""', document, null, XPathResult.STRING_TYPE, null).stringValue, "");
    shouldBe(evaluator.evaluate('"Hi"', document, null, XPathResult.STRING_TYPE, null).stringValue, "Hi");
    shouldBe(evaluator.evaluate('"NaN"', document, null, XPathResult.STRING_TYPE, null).stringValue, "NaN");
    shouldBe(evaluator.evaluate('"\u2022 = middle dot"', document, null, XPathResult.STRING_TYPE, null).stringValue, "\u2022 = middle dot");
    shouldBe(evaluator.evaluate('"0"', document, null, XPathResult.STRING_TYPE, null).stringValue, "0");
    shouldBe(evaluator.evaluate('"1"', document, null, XPathResult.STRING_TYPE, null).stringValue, "1");
    shouldBe(evaluator.evaluate('"2"', document, null, XPathResult.STRING_TYPE, null).stringValue, "2");
    shouldBe(evaluator.evaluate('"3"', document, null, XPathResult.STRING_TYPE, null).stringValue, "3");
    shouldBe(evaluator.evaluate('"4"', document, null, XPathResult.STRING_TYPE, null).stringValue, "4");
    shouldBe(evaluator.evaluate('"5"', document, null, XPathResult.STRING_TYPE, null).stringValue, "5");
    shouldBe(evaluator.evaluate('"31"', document, null, XPathResult.STRING_TYPE, null).stringValue, "31");
    shouldBe(evaluator.evaluate('"-1"', document, null, XPathResult.STRING_TYPE, null).stringValue, "-1");
    shouldBe(evaluator.evaluate('"-2"', document, null, XPathResult.STRING_TYPE, null).stringValue, "-2");
    shouldBe(evaluator.evaluate('"-3"', document, null, XPathResult.STRING_TYPE, null).stringValue, "-3");
    shouldBe(evaluator.evaluate('"-4"', document, null, XPathResult.STRING_TYPE, null).stringValue, "-4");
    shouldBe(evaluator.evaluate('"-5"', document, null, XPathResult.STRING_TYPE, null).stringValue, "-5");
    shouldBe(evaluator.evaluate('"3.1415926535"', document, null, XPathResult.STRING_TYPE, null).stringValue, "3.1415926535");

    shouldBe(evaluator.evaluate('0', document, null, XPathResult.NUMBER_TYPE, null).numberValue, 0.0);
    shouldBe(evaluator.evaluate('0.5', document, null, XPathResult.NUMBER_TYPE, null).numberValue, 0.5);
    shouldBe(evaluator.evaluate('-0.5', document, null, XPathResult.NUMBER_TYPE, null).numberValue, -0.5);
    shouldBe(evaluator.evaluate('1', document, null, XPathResult.NUMBER_TYPE, null).numberValue, 1.0);
    shouldBe(evaluator.evaluate('-1', document, null, XPathResult.NUMBER_TYPE, null).numberValue, -1.0);
    shouldBe(evaluator.evaluate('1.5', document, null, XPathResult.NUMBER_TYPE, null).numberValue, 1.5);
    shouldBe(evaluator.evaluate('-1.5', document, null, XPathResult.NUMBER_TYPE, null).numberValue, -1.5);
    shouldBe(evaluator.evaluate('2', document, null, XPathResult.NUMBER_TYPE, null).numberValue, 2.0);
    shouldBe(evaluator.evaluate('-2', document, null, XPathResult.NUMBER_TYPE, null).numberValue, -2.0);
    shouldBe(evaluator.evaluate('2.6', document, null, XPathResult.NUMBER_TYPE, null).numberValue, 2.6);
    shouldBe(evaluator.evaluate('-2.6', document, null, XPathResult.NUMBER_TYPE, null).numberValue, -2.6);
    shouldBe(evaluator.evaluate('3', document, null, XPathResult.NUMBER_TYPE, null).numberValue, 3.0);
    shouldBe(evaluator.evaluate('-3', document, null, XPathResult.NUMBER_TYPE, null).numberValue, -3.0);
    shouldBe(evaluator.evaluate('31', document, null, XPathResult.NUMBER_TYPE, null).numberValue, 31.0);
    shouldBe(evaluator.evaluate('4', document, null, XPathResult.NUMBER_TYPE, null).numberValue, 4.0);
    shouldBe(evaluator.evaluate('-4', document, null, XPathResult.NUMBER_TYPE, null).numberValue, -4.0);
    shouldBe(evaluator.evaluate('4.5', document, null, XPathResult.NUMBER_TYPE, null).numberValue, 4.5);
    shouldBe(evaluator.evaluate('-4.5', document, null, XPathResult.NUMBER_TYPE, null).numberValue, -4.5);
    shouldBe(evaluator.evaluate('5', document, null, XPathResult.NUMBER_TYPE, null).numberValue, 5.0);
    shouldBe(evaluator.evaluate('-5', document, null, XPathResult.NUMBER_TYPE, null).numberValue, -5.0);
    shouldBe(evaluator.evaluate('-42', document, null, XPathResult.NUMBER_TYPE, null).numberValue, -42.0);
    
    checkTestFailures();    
}