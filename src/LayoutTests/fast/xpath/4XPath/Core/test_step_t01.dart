/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Core/test_step.html
 * @description 
 */
import "dart:html";
import "../../xpath-test-pre.dart";
import "test.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    var result;
    
    result = evaluator.evaluate("ancestor::*", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("ancestor::*", result, [ROOT]);

    result = evaluator.evaluate("ancestor-or-self::*", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("ancestor-or-self::*", result, [ROOT, CHILD1]);

    result = evaluator.evaluate("descendant-or-self::GCHILD", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("descendant-or-self::*", result, GCHILDREN1);

    result = evaluator.evaluate("child::GCHILD[position()=1]", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("child::GCHILD[position()=1]", result, [GCHILD11]);

    result = evaluator.evaluate("child::GCHILD[1]", CHILD1, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("child::GCHILD[1]", result, [GCHILD11]);
   
    checkTestFailures();    
}