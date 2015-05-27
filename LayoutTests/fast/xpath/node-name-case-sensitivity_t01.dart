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
    document.body.appendHtml(htmlEL);
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

    void testHTML(query, expectedCount) {
        var res = evaluator.evaluate(query
            , document
            , nsResolver
            , XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE
            , null);
        shouldBe(res.snapshotLength, expectedCount, "HTML $query");
    }

    void testXML(query, expectedCount) {
        var res = evaluator.evaluate(query
            , doc
            , nsResolver
            , XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE
            , null);
        shouldBe(res.snapshotLength, expectedCount, "XML $query");
    }

    testHTML('//*[@id="sometext"]//strong', 2);
    testHTML('//*[@id="sometext"]//Strong', 2);
    testHTML('//*[@id="Sometext"]//strong', 0);
    testHTML('//*[@id="sometext"]//foo', 2);
    testHTML('//*[@id="sometext"]//FOO', 2);

    testXML('//*[@id="sometext"]//foo', '1');
    testXML('//*[@id="sometext"]//FOO', '1');

    checkTestFailures();
}
