/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=12581">bug 12581</a>:
 * XPath //title shouldn't match &lt;title> in XHTML.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL = r'''
    <title/>
''';

void main() {
//    document.head.appendHtml(htmlEL); - not needed while the test harness generates html wrappers with titles
    XPathEvaluator evaluator=new XPathEvaluator();

    var result = evaluator.evaluate("//title", document.documentElement, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    Expect.equals(0, result.snapshotLength);
}