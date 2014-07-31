/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=15437">bug 15437</a>:
 * XPath substring-after function is broken.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    shouldBe(evaluator.evaluate("substring-after('abcde', 'd')", document, null, XPathResult.STRING_TYPE, null).stringValue, 'e');
    shouldBe(evaluator.evaluate("substring-after('abcde', 'f')", document, null, XPathResult.STRING_TYPE, null).stringValue, '');
    shouldBe(evaluator.evaluate("substring-after('abcde', '')", document, null, XPathResult.STRING_TYPE, null).stringValue, 'abcde');
    shouldBe(evaluator.evaluate("substring-after('1999/04/01', '/')", document, null, XPathResult.STRING_TYPE, null).stringValue, '04/01');
    shouldBe(evaluator.evaluate("substring-after('1999/04/01', '19')", document, null, XPathResult.STRING_TYPE, null).stringValue, '99/04/01');

}