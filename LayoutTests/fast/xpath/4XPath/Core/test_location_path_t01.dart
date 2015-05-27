/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Core/test_location_path.html
 * @description 
 */
import "dart:html";
import "../../xpath-test-pre.dart";
import "test.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    var result;
    List expected;
    result = evaluator.evaluate("//*", CHILD2, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    expected=new List.from([ROOT, CHILD1])..addAll(GCHILDREN1)..add(CHILD2)..addAll(GCHILDREN2)
        ..add(CHILD3)..add(LANG)..addAll(LCHILDREN);
    checkSnapshot("//*", result, expected);

    result = evaluator.evaluate("*/*", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    expected=new List.from(GCHILDREN1)..addAll(GCHILDREN2)..addAll(LCHILDREN);
    checkSnapshot("*/*", result, expected);

    result = evaluator.evaluate("/", CHILD1, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("/", result, [DOM]);

    result = evaluator.evaluate("/child::*", CHILD2, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("/child::*", result, [ROOT]);

    result = evaluator.evaluate("child::*/child::*", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    expected=new List.from(GCHILDREN1)..addAll(GCHILDREN2)..addAll(LCHILDREN);
    checkSnapshot("child::*/child::*", result, expected);
    
    checkTestFailures();
    
}