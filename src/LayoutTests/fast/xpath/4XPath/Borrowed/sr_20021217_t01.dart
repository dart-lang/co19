/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Borrowed/sr_20021217.html
 * @description http://lists.fourthought.com/pipermail/4suite/2002-December/004771.html
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../../../testcommon.dart";

void main() {
    String DOC1 = '<a><b><c/><d/></b></a>';
    XPathEvaluator evaluator=new XPathEvaluator();

    Document doc = (new DomParser()).parseFromString(DOC1, "application/xml");
    var nodeset = evaluator.evaluate('.//*', doc.documentElement, null, XPathResult.ORDERED_NODE_ITERATOR_TYPE, null);
    String node_names = "";
    var currNode;
    while ((currNode = nodeset.iterateNext())!=null)
        node_names += currNode.nodeName;
    shouldBe(node_names, "bcd");

    nodeset = evaluator.evaluate('(.//*)[1]', doc.documentElement, null, XPathResult.ORDERED_NODE_ITERATOR_TYPE, null);
    node_names = "";
    currNode='';
    while ((currNode = nodeset.iterateNext())!=null)
        node_names += currNode.nodeName;
    shouldBe(node_names, "b");
}