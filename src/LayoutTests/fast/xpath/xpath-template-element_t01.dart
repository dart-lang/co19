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
import "xpath-test-pre.dart";

const String htmlEL = r'''
''';

void main() {
    document.body.appendHtml(htmlEL);
    XPathEvaluator evaluator=new XPathEvaluator();
<!DOCTYPE html>
<html>
<head>
<script src="../../resources/js-test.js"></script>
</head>
<body>
<p>This tests that XPath expressions do not consider (traverse into) template content</p>

<div id=test>
    <span>A</span>
    <span>B</span>
    <template>
        <span>C</span>
        <span>D</span>
    </template>
</div>

<div id="console"></div>
<script>
var test = document.getElementById('test');
var result = document.evaluate('count(//span)', test, null, XPathResult.NUMBER_TYPE, null);
shouldBe("document.evaluate('count(//span)', test, null, XPathResult.NUMBER_TYPE, null).numberValue", "2");
</script>
</body>
</html>
