/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Borrowed/rs_20010831.html
 * @description 
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../../../testcommon.dart";

void main() {
    String test = r'''
<foo>
    <bar>normal text</bar>
    <f>f1</f>
    Free range chickens
    <bar><![CDATA[<cdatatext>]]></bar>
    <f>f2</f>
</foo>
''';
    XPathEvaluator evaluator=new XPathEvaluator();

    Document doc = (new DomParser()).parseFromString(test, "application/xml");

    var nodeset = evaluator.evaluate('//bar/text()', doc, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    shouldBe(nodeset.snapshotLength, 2);
    shouldBe(nodeset.snapshotItem(0).nodeValue, "normal text");
    shouldBe(nodeset.snapshotItem(1).nodeValue, "<cdatatext>");

    nodeset = evaluator.evaluate('//bar[2]/text()', doc, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    shouldBe(nodeset.singleNodeValue.nodeValue, "<cdatatext>");
}
