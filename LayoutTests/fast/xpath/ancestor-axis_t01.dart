/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=12619">bug 12619</a>:
 * Non-abbreviated XPaths don't work. 
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL = r'''
  <div id="a"></div>
''';

void main() {
    document.body.appendHtml(htmlEL);
    XPathEvaluator evaluator=new XPathEvaluator();

    var result = evaluator.evaluate("//div/ancestor::*", document.body, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);

    Expect.equals(2, result.snapshotLength);
}