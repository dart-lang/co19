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
import "xpath-test-pre.dart";

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
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  XPathEvaluator evaluator = new XPathEvaluator();

  void testId(String expr, String id, String expected) {
    Node res = evaluator
        .evaluate(expr, document.getElementById(id), null,
            XPathResult.ANY_UNORDERED_NODE_TYPE, null)
        .singleNodeValue;
    shouldBe((res as Element).id, expected, expr);
  }

  void testTag(String expr, String id, String expected) {
    Node res = evaluator
        .evaluate(expr, document.getElementById(id), null,
            XPathResult.ANY_UNORDERED_NODE_TYPE, null)
        .singleNodeValue;
    shouldBe((res as Element).tagName, expected, expr);
  }

  testId('preceding-sibling::*[1]', 'd3', 'd2');

  testId('preceding::*[1]', 'd31', 'd21');
  testId('preceding::*[2]', 'd31', 'd2');
  testId('preceding::*[3]', 'd31', 'd1');
  testTag('preceding::*[4]', 'd31', 'A');
  testTag('preceding::*[5]', 'd31', 'P');

  testId('ancestor::*[1]', 'd31', 'd3');

  testId('ancestor-or-self::*[1]', 'd31', 'd31');

  checkTestFailures();
}
