/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test that iterators are invalidated even if the original context is detached.
 */
import "dart:html";
import "xpath-test-pre.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    var doc = document.implementation.createDocument(null, "doc", null);
    var root = doc.createElement("div");
    root.append(doc.createElement("span"));
    root.append(doc.createElement("p"));
    
    var result = evaluator.evaluate(".//*", root, null, XPathResult.ORDERED_NODE_ITERATOR_TYPE, null);
    shouldBe(result.invalidIteratorState, false);
    shouldBe(result.iterateNext().tagName, 'span');
    
    doc.documentElement.setAttribute("foo", "bar");
    
    shouldBe(result.invalidIteratorState, true);
    shouldThrow((){result.iterateNext();});

    checkTestFailures();    
}