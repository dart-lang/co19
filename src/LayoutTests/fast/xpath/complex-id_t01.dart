/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=12452">bug 12452</a>:
 * XPath id() function is not supported.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";
import "xpath-test-pre.dart";

const String htmlEL = r'''
  <div id=test1 style="display:none">
    a
  </div>
  <div id=test2 style="display:none">
    b c
    d
  </div>

  <div id="a"></div>
  <div id="b"></div>
  <div id="c"></div>
  <div id="d"></div>
''';

void main() {
  document.body.appendHtml(htmlEL);
  XPathEvaluator evaluator=new XPathEvaluator();

  var UNORDERED_NODE_SNAPSHOT_TYPE = 6;

  var result = evaluator.evaluate("id(id(' test1  test2 '))", document.body, null, UNORDERED_NODE_SNAPSHOT_TYPE, null);
  Expect.equals(4, result.snapshotLength);
}