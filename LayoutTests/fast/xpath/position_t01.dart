/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description 
 */
import "dart:html";
import "../../testcommon.dart" as testcommon;
import "xpath-test-pre.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();

    Element ROOT = document.createElement('div');
    ROOT.innerHtml = '<p>a</p><div><span id="21"></span><span id="22"></span><span id="23"></span></div>';
    Node CHILD1 = ROOT.firstChild;
    Node CHILD1TEXT = CHILD1.firstChild;
    Node CHILD2 = ROOT.lastChild;
    Node CHILD21 = CHILD2.firstChild;
    Element CHILD22 = (CHILD21 as Element).nextElementSibling;
    Element CHILD23 = CHILD22.nextElementSibling;
    XPathResult result;

    result = evaluator.evaluate(".//*", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot(".//*", result, [CHILD1, CHILD2, CHILD21, CHILD22, CHILD23]);

    result = evaluator.evaluate("*[position() = 2]", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("*[position() = 2]", result, [CHILD2]);

    result = evaluator.evaluate(".//*[position() = 2]", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot(".//*[position() = 2]", result, [CHILD2, CHILD22]);

    result = evaluator.evaluate("./././/*[2]/.", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("./././/*[2]/.", result, [CHILD2, CHILD22]);

    result = evaluator.evaluate(".//*/span[2]", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot(".//*/span[2]", result, [CHILD22]);

    result = evaluator.evaluate(".//*[position() = 1]", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot(".//*[position() = 1]", result, [CHILD1, CHILD21]);

    result = evaluator.evaluate("./descendant-or-self::node()/child::*[position() = 2]", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("./descendant-or-self::node()/child::*[position() = 2]", result, [CHILD2, CHILD22]);

    result = evaluator.evaluate("descendant-or-self::node()/child::*[position() = 2]", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("descendant-or-self::node()/child::*[position() = 2]", result, [CHILD2, CHILD22]);

    result = evaluator.evaluate(".//*/*[2]", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot(".//*/*[2]", result, [CHILD22]);

    result = evaluator.evaluate("preceding::node()[1]", CHILD2, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("preceding::node()[1]", result, [CHILD1TEXT]);

    result = evaluator.evaluate("preceding::node()[2]", CHILD2, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("preceding::node()[2]", result, [CHILD1]);

    result = evaluator.evaluate("preceding::node()[3]", CHILD2, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("preceding::node()[3]", result, []);

    result = evaluator.evaluate("preceding::node()/*[3]", CHILD2, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("preceding::node()/*[3]", result, []);

    result = evaluator.evaluate("ancestor::node()[2]", CHILD21, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("ancestor::node()[2]", result, [ROOT]);

    result = evaluator.evaluate("ancestor-or-self::node()[2]", CHILD21, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("ancestor-or-self::node()[2]", result, [CHILD2]);

    result = evaluator.evaluate("ancestor-or-self::node()[3]", CHILD21, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("ancestor-or-self::node()[3]", result, [ROOT]);

    result = evaluator.evaluate("preceding::span[1]", CHILD23, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("preceding::span[1]", result, [CHILD22]);

    result = evaluator.evaluate("(preceding::span)[1]", CHILD23, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("(preceding::span)[1]", result, [CHILD21]);
    
    const String htmlEL = r'''
    <div>
    <p num="1"></p>
    <p num="2" type="warning"></p>
    <p num="3" type="warning"></p>
    <p num="4" type="warning"></p>
    <p num="5" type="warning"></p>
    <p num="6" type="warning"></p>
    </div>
    ''';
    var ROOT2 = new DocumentFragment.html(htmlEL, treeSanitizer: new testcommon.NullTreeSanitizer()).firstChild;
    shouldBe(evaluator.evaluate('p[@type=\"warning\"][5]/@num', ROOT2, null, XPathResult.STRING_TYPE, null).stringValue, "6");
    shouldBe(evaluator.evaluate('p[5][@type=\"warning\"]/@num', ROOT2, null, XPathResult.STRING_TYPE, null).stringValue, "5");

    checkTestFailures();    
}