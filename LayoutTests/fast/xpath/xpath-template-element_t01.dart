/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description This tests that XPath expressions do not consider (traverse into) template content
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

const String htmlEL = r'''
<div id=test>
    <span>A</span>
    <span>B</span>
    <template>
        <span>C</span>
        <span>D</span>
    </template>
</div>
''';

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
    XPathEvaluator evaluator = new XPathEvaluator();
    var test = document.getElementById('test');
    var result = evaluator.evaluate('count(//span)', test, null,
        XPathResult.NUMBER_TYPE, null);
    shouldBe(result.numberValue, 2);
}