/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Borrowed/kd_20010423.html
 * @description 
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../../../testcommon.dart";

void main() {
    String SRC_1 = r'''
<?xml version="1.0" encoding="utf-8"?>
<doc>
<elem>abc</elem>
<elem><![CDATA[abc]]></elem>
<elem>a<![CDATA[b]]>c</elem>
</doc>
''';

    XPathEvaluator evaluator=new XPathEvaluator();
    Document doc = (new DomParser()).parseFromString(SRC_1, "application/xml");

    String EXPR = '/doc/elem/text()';
    var nodeset = evaluator.evaluate(EXPR, doc, null, XPathResult.UNORDERED_NODE_ITERATOR_TYPE, null);
    var actual = "";
    Node currNode=nodeset.iterateNext();
    while (currNode!=null) {
        actual += currNode.nodeValue;
        currNode=nodeset.iterateNext();
    }
    
    // According to DOM XPath working group note, this should be "abcabca", but we'll rather match Firefox.
    // See <http://www.w3.org/TR/DOM-Level-3-XPath/xpath.html#TextNodes>.
    shouldBe(actual, "abcabcabc");
}