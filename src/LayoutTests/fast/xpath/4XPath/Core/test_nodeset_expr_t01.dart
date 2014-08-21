/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Core/test_nodeset_expr.html
 * @description 
 */
import "dart:html";
import "../../xpath-test-pre.dart";
import "test.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    var result;
    
    result = evaluator.evaluate("(/ROOT | /ROOT/CHILD1)[true()]", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("(/ROOT | /ROOT/CHILD1)[true()]", result, [ROOT, CHILD1]);

    result = evaluator.evaluate("(/ROOT | /ROOT/CHILD1)[.=/ROOT]", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("(/ROOT | /ROOT/CHILD1)[.=/ROOT]", result, [ROOT]);

    result = evaluator.evaluate("(/ROOT | /ROOT/CHILD1) | (/ROOT)", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("(/ROOT | /ROOT/CHILD1) | (/ROOT)", result, [ROOT, CHILD1]);
    
    checkTestFailures();    
}