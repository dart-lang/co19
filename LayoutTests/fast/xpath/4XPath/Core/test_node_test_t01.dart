/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Core/test_node_test.html
 * @description 
 */
import "dart:html";
import "../../xpath-test-pre.dart";
import "test.dart";

class MyXPathNSResolver implements XPathNSResolver {
    String lookupNamespaceUri(String prefix) {
        if (prefix == 'bar')
            return 'http://foo.com';
//        Expect.fail("Unexpected prefix:$prefix");
        return null;
    }
}

void main() {
    XPathNSResolver nsResolver = new MyXPathNSResolver();

    bool nodeInResult(node, result) {
        for (int i=0; i < result.snapshotLength; ++i)
            if (result.snapshotItem(i) == node)
                return true;
        return false;
    }

    XPathEvaluator evaluator=new XPathEvaluator();

    var result = evaluator.evaluate("//*", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    shouldBe(nodeInResult(ROOT, result), true);

    result = evaluator.evaluate("//node()", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    shouldBe(nodeInResult(ROOT, result), true);
    shouldBe(nodeInResult(TEXT1, result), true);

    result = evaluator.evaluate("//text()", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    shouldBe(nodeInResult(ROOT, result), false);
    shouldBe(nodeInResult(TEXT1, result), true);

    result = evaluator.evaluate("//comment()", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    shouldBe(nodeInResult(ROOT, result), false);
    print("p0");
    shouldBe(nodeInResult(COMMENT, result), true);
    print("p1");

    result = evaluator.evaluate("//processing-instruction()", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    shouldBe(nodeInResult(ROOT, result), false);
    shouldBe(nodeInResult(PI, result), true);

    result = evaluator.evaluate("//processing-instruction('xml-stylesheet')", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    shouldBe(nodeInResult(PI, result), true);
    shouldBe(nodeInResult(PI2, result), false);
    
    checkTestFailures();    
}
