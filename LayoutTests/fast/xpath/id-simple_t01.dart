/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=15380">bug 15380</a>:
 * XPath: id('foo') doesn't resolve correctly.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL = r'''
<div id="nested1">
        <div id="nested2">
            <input id="nested3a" type="button" value="nested3a">
            <input id="nested3b" type="button" value="nested3b">
        </div>
    </div>
    <div id="results"></div>
''';

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
    XPathEvaluator evaluator = new XPathEvaluator();
    var results = "";
    var result;
    var testNum = 1;
    bool failed=false;
    
    void runXPath(xpath) {
        var result = evaluator.evaluate(xpath, document, null,
            XPathResult.ANY_TYPE, null).iterateNext();
        bool passed=true;
        if (result == null) {
          failed = true;
        }        
        results = '${results}${xpath} + ${(passed ? "PASSED" : "FAILED")}: $result<br />';
    }

    void init() {
        var tests = [
            "id('nested1')",
            "id('nested1')/div[1]",
            "id('nested1')//div[1]",
            "id('nested1')/div[1]/input[2]",
            "id('nested1')/div[1]//input[2]",
            "id('nested1')//div[1]/input[2]",
            "id('nested1')//div[1]//input[2]"
        ];
        for (var i = 0; i < tests.length; i++) {
            runXPath(tests[i]);
        }
        document.getElementById('results').innerHtml = results;
    }
    
    init();
    Expect.isFalse(failed);
}