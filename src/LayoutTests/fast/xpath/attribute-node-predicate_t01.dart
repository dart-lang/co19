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
import "../../../Utils/expect.dart";
import "../../testcommon.dart";
import "xpath-test-pre.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();

var ROOT = document.createElement('div');
ROOT.innerHtml = '<p>a</p><div><span id="21"></span><span id="22"></span><span id="23"></span></div>';
var CHILD1 = ROOT.firstChild;
var CHILD1TEXT = CHILD1.firstChild;
var CHILD2 = ROOT.lastChild;
var CHILD21 = CHILD2.firstChild;
var CHILD22 = CHILD21.nextElementSibling;
var CHILD23 = CHILD22.nextElementSibling;
var result;

    result = evaluator.evaluate(".//@id[false]", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("//@id[false]", result, []);

    result = evaluator.evaluate(".//@id[1]/parent::*", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("//@id[1]/parent::*", result, [CHILD21, CHILD22, CHILD23]);

    result = evaluator.evaluate(".//@id[2]/parent::*", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("//@id[2]/parent::*", result, []);

    result = evaluator.evaluate(".//@id[string()='21']/parent::*", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("//@id[string()='21']/parent::*", result, [CHILD21]);

    result = evaluator.evaluate(".//@id[string()='22']/parent::*", ROOT, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    checkSnapshot("//@id[string()='22']/parent::*", result, [CHILD22]);

}
