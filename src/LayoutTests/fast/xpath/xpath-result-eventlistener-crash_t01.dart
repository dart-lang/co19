/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for bug <a href="https://bugs.webkit.org/show_bug.cgi?id=34231">34231</a>:
 * Nodes in XPath result snapshots should keep JS wrappers alive.
 * This page tests for proper invalidation of a node's event listeners. 
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL = r'''
<div id="div"></div>
''';

void allocate() {
    for (var i = 0; i < 100000; ++i)
        new String.fromCharCode(100+i);
}

void main() {
    document.body.appendHtml(htmlEL);
    XPathEvaluator evaluator=new XPathEvaluator();

    // Fill the heap with event listeners...
    var a = [];
    for (var i = 0; i < 10000; ++i)
        a.add(() { });

    // ...followed by a DOM node wrapper
    var div = document.getElementById("div");

    // Add the listeners to the DOM node.
    for (var i = 0; i < a.length; ++i)
        div.addEventListener("click", a[i], false);

    // Eliminate JS references to the div and its listeners, but keep a reference to the div in an XPath query.
    var query = evaluator.evaluate("//div", document.documentElement, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    div.remove();
    div = null;
    a = null;

    // Potentially overwrite listeners with strings, but don't overwrite div.
    allocate();

    // Fire listeners and see if we crash.
    Event event = new Event('MouseEvent', canBubble: true, cancelable: true);
    query.snapshotItem(0).dispatchEvent(event);

    print("PASS: You didn't crash.");
}