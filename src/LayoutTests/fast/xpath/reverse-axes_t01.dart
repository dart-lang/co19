/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=15436">bug 15436</a>:
 * Wrong proximity positions for XPath reverse axes.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

const String htmlEL = r'''
<div id="d">
  <div id="d1"></div>
  <div id="d2">
    <div id="d21"></div>
  </div>
  <div id="d3">
    <div id="d31"></div>
  </div>
</div>
''';

void main() {
    document.body.appendHtml(htmlEL);
    XPathEvaluator evaluator=new XPathEvaluator();

    shouldBe(evaluator.evaluate('preceding-sibling::*[1]', document.getElementById('d3'), null, XPathResult.ANY_UNORDERED_NODE_TYPE, null).singleNodeValue.id, 'd2');

    shouldBe(evaluator.evaluate('preceding::*[1]', document.getElementById('d31'), null, XPathResult.ANY_UNORDERED_NODE_TYPE, null).singleNodeValue.id, 'd21');
    shouldBe(evaluator.evaluate('preceding::*[2]', document.getElementById('d31'), null, XPathResult.ANY_UNORDERED_NODE_TYPE, null).singleNodeValue.id, 'd2');
    shouldBe(evaluator.evaluate('preceding::*[3]', document.getElementById('d31'), null, XPathResult.ANY_UNORDERED_NODE_TYPE, null).singleNodeValue.id, 'd1');
    shouldBe(evaluator.evaluate('preceding::*[4]', document.getElementById('d31'), null, XPathResult.ANY_UNORDERED_NODE_TYPE, null).singleNodeValue.tagName, 'A');
    shouldBe(evaluator.evaluate('preceding::*[5]', document.getElementById('d31'), null, XPathResult.ANY_UNORDERED_NODE_TYPE, null).singleNodeValue.tagName, 'P');

    shouldBe(evaluator.evaluate('ancestor::*[1]', document.getElementById('d31'), null, XPathResult.ANY_UNORDERED_NODE_TYPE, null).singleNodeValue.id, 'd3');

    shouldBe(evaluator.evaluate('ancestor-or-self::*[1]', document.getElementById('d31'), null, XPathResult.ANY_UNORDERED_NODE_TYPE, null).singleNodeValue.id, 'd31');

}