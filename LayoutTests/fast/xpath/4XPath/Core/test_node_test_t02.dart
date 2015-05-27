/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Core/test_node_test.html
 * @description evaluator.evaluate for "//bar:CHILD3" and "//bar:*" fails
 */
import "dart:html";
import "../../xpath-test-pre.dart";
import "test.dart";

class MyXPathNSResolver implements XPathNSResolver {
    String lookupNamespaceUri(String prefix) {
        if (prefix == 'bar')
            return 'http://foo.com';
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

    var result = evaluator.evaluate("//bar:CHILD3", ROOT, nsResolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    shouldBe(nodeInResult(ROOT, result), false);
    shouldBe(nodeInResult(CHILD1, result), false);
    shouldBe(nodeInResult(CHILD3, result), true);
    
    result = evaluator.evaluate("//bar:*", ROOT, nsResolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    shouldBe(nodeInResult(ROOT, result), false);
    shouldBe(nodeInResult(CHILD1, result), false);
    shouldBe(nodeInResult(CHILD3, result), true);

    checkTestFailures();    
}
