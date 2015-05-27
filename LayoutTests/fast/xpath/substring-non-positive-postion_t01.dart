/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=41913">bug 41913</a>:
 * XPath substring function does not correctly handle non-positive values for the position argument.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    shouldBe(evaluator.evaluate("substring('abcde', 0)", document, null, XPathResult.STRING_TYPE, null).stringValue, 'abcde');
    shouldBe(evaluator.evaluate("substring('abcde', -2)", document, null, XPathResult.STRING_TYPE, null).stringValue, 'abcde');
    shouldBe(evaluator.evaluate("substring('abcde', 0, 5)", document, null, XPathResult.STRING_TYPE, null).stringValue, 'abcd');
    shouldBe(evaluator.evaluate("substring('abcde', -2, 5)", document, null, XPathResult.STRING_TYPE, null).stringValue, 'ab');

}