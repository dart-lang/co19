/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Core/test_predicate_list.html
 * @description 
 */
import "dart:html";
import "../../xpath-test-pre.dart";
import "test.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    var result;

    result = evaluator.evaluate("self::node()[true() and false()][true()]", ROOT, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("self::node()[true() and false()][true()]", result, []);

    result = evaluator.evaluate("self::node()[true() or false()][true()]", ROOT, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("self::node()[true() or false()][true()]", result, [ROOT]);

    var dom2 = (new DomParser()).parseFromString(
        "<?xml version='1.0'?>" +
        "<elementList>" +
        "    <element>" +
        "        <x>" +
        "           <y>a</y>" +
        "        </x>" +
        "    </element>" +
        "    <element>" +
        "        <x>" +
        "            <y>z</y>" +
        "        </x>" +
        "    </element>" +
        "</elementList>",
        "application/xml");

    result = evaluator.evaluate("//element[descendant::y[.='z']]", dom2, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("//element[descendant::y[.='z']]", result, [dom2.getElementsByTagName("element")[1]]);

    result = evaluator.evaluate("//element[descendant::y[.='z']][1]", dom2, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("//element[descendant::y[.='z']][1]", result, [dom2.getElementsByTagName("element")[1]]);

    result = evaluator.evaluate("//element[descendant::y[.='z']][2]", dom2, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("//element[descendant::y[.='z']][2]", result, []);
   
    checkTestFailures();    
}
