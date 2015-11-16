/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description xpath expressions considered invalid by dart, but valid in js
 */
import "dart:html";
import "../../testharness.dart";
import "xpath-test-pre.dart";

const String htmlEL = r'''
<p id="sometext">
<STRONG>strong</STRONG><strong>strong</strong><FOO>FOO</FOO><foo>foo</foo>
</p>
''';

class MyXPathNSResolver implements XPathNSResolver {
    
    String lookupNamespaceUri(String prefix) {
        return "http://www.w3.org/1999/xhtml";
    }
}

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: new NullTreeSanitizer());
    XPathEvaluator evaluator=new XPathEvaluator();
    XPathNSResolver nsResolver = new MyXPathNSResolver();

    var doc = (new DomParser()).parseFromString('''
       <p id="sometext" xmlns="http://www.w3.org/1999/xhtml">
           <STRONG>strong</STRONG>
           <strong>strong</strong>
           <FOO xmlns="">FOO</FOO>
           <foo xmlns="">foo</foo>
       </p>'''
       , 'application/xhtml+xml');

    void testXML(query, expectedCount) {
        var res = evaluator.evaluate(query
            , doc
            , nsResolver
            , XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE
            , null);
        shouldBe(res.snapshotLength, expectedCount, "XML $query");
    }


    testXML('//*[@id="sometext"]//x:strong', '1');
    testXML('//*[@id="sometext"]//x:Strong', '0');
    testXML('//*[@id="Sometext"]//x:strong', '0');

    checkTestFailures();
}
