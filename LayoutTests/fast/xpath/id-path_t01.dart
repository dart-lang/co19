/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=12485">bug 12485</a>:
 * XPath id() function doesn't work as root in paths.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL = r'''
  <div id="a"><div></div></div>
  <div id="bb"><div></div></div>
  <div id="ccc"><div></div></div>
''';

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
    XPathEvaluator evaluator = new XPathEvaluator();
    var UNORDERED_NODE_SNAPSHOT_TYPE = 6;

    var result = evaluator.evaluate("id('a bb ccc')[@id != 'ccc']/div",
        document.body, null, UNORDERED_NODE_SNAPSHOT_TYPE, null);

    Expect.equals(2, result.snapshotLength);
}