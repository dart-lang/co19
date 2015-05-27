/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Core/test_core_functions.html
 * @description //f:CHILD3 causes error
 */
import "dart:html";
import "../../xpath-test-pre.dart";
import "test.dart";

class MyXPathNSResolver implements XPathNSResolver {
    String lookupNamespaceUri(String prefix) {
        if (prefix == 'f')
            return 'http://foo.com';
        return null;
    }
}

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    
    XPathNSResolver nsResolver = new MyXPathNSResolver();

    shouldBe(evaluator.evaluate("local-name(//f:CHILD3)", CHILD1, nsResolver, XPathResult.ANY_TYPE, null).stringValue, "CHILD3");
    shouldBe(evaluator.evaluate("namespace-uri(//f:CHILD3)", CHILD1, nsResolver, XPathResult.ANY_TYPE, null).stringValue, "http://foo.com");
    shouldBe(evaluator.evaluate("name(//f:CHILD3)", CHILD1, nsResolver, XPathResult.ANY_TYPE, null).stringValue, "foo:CHILD3");
    
    checkTestFailures();
}