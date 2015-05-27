/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description 
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    shouldBe(evaluator.evaluate("substring('12345', number('NaN'))", document, null, XPathResult.STRING_TYPE, null).stringValue, '');
    shouldBe(evaluator.evaluate("substring('12345', number('NaN'), 3)", document, null, XPathResult.STRING_TYPE, null).stringValue, '');

    /* -2147483645 represents MIN_INT-3 which when passed through the original substring function
       before the fix for 41862 landed caused an overflow and wrap to 2.
       That meant that this case was effectively calling substring('12345', MIN_INT, 2) and
       returning 12, rather than the empty string which the NaN should have triggered.
    */
    shouldBe(evaluator.evaluate("substring('12345', number('NaN'), -2147483645)", document, null, XPathResult.STRING_TYPE, null).stringValue, '');

    shouldBe(evaluator.evaluate("substring('12345', number('NaN'), number('NaN'))", document, null, XPathResult.STRING_TYPE, null).stringValue, '');

}