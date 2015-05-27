/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description evaluate("//@ns:attr2") fails
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "xpath-test-pre.dart";

class MyXPathNSResolver implements XPathNSResolver {
    String lookupNamespaceUri(String prefix) {
        if (prefix == "ns")
            return "foobarns";
        if (prefix == "xml")
            return "http://www.w3.org/XML/1998/namespace";
        if (prefix == "xmlns")
            return "http://www.w3.org/2000/xmlns/";
        Expect.fail("Unexpected prefix:$prefix");
        return null;
    }
}

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    XPathNSResolver nsResolver = new MyXPathNSResolver();

    Document doc = (new DomParser()).parseFromString('''
    <doc>
      <elem attr1="1" ns:attr2="2" xml:id="3" ns:xmlns="4" xmlns:ns="foobarns" xmlns="barfoons"/>
    </doc>''',
    'application/xml');

    shouldBe(evaluator.evaluate("//@ns:attr2", doc, nsResolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotLength, 1);
    shouldBe(evaluator.evaluate("//@ns:xmlns", doc, nsResolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotLength, 1);
    shouldBe(evaluator.evaluate("//@ns:*", doc, nsResolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotLength, 2);
    shouldBe(evaluator.evaluate("//@xml:*", doc, nsResolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotLength, 1);
    shouldBe(evaluator.evaluate("//@xmlns:*", doc, nsResolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotLength, 0);

    checkTestFailures();    
}