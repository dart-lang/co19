/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=12602">bug 12602</a>: 
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL = r'''
<div id="nested1">
    <div style="display:none">123</div>
''';

void main() {
    document.body.appendHtml(htmlEL);
    XPathEvaluator evaluator=new XPathEvaluator();

    var tests = [
          "//div[string() = '123']"
          , "//div[normalize-space() = '123']"
          , "//div[string-length() = 3]"
          , "//div[number() = 123]"
    ];

    for (var i = 0; i < tests.length; i++) {
        String test = tests[i];
        var result = evaluator.evaluate(test, document.documentElement, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
        Expect.equals(1, result.snapshotLength, test);
    }
}