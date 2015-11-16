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
import "../../testharness.dart";

const String htmlEL1 = r'''
<style>
    div.box { -webkit-box-sizing: border; border: solid blue; }
    div.shorter { height: 54px; }
    div.taller { height: 72px; }
</style>
''';

const String htmlEL2 = r'''
<div style="height: 100px; width: 630; -webkit-columns:6; -webkit-column-gap:5px; columns:6; column-gap:5px;">
    <div class="taller box"></div>
    <div class="taller box"></div>
    <div id="break-before" class="shorter box" style="-webkit-column-break-before: always;"></div>
    <div class="shorter box" style="-webkit-column-break-after: always;"></div>
    <div id="after-break" class="shorter box"></div>
    <div id="no-break" class="shorter box" style="-webkit-column-break-inside: avoid;"></div>
</div>
<pre id="console"></pre>
''';

void testBoxPosition(id, expectedLeft, expectedTop) {
    var rect = document.getElementById(id).getBoundingClientRect();
    shouldBe(rect.left.round(), expectedLeft, "$id left");
    shouldBe(rect.top.round(), expectedTop, "$id top");
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    testBoxPosition("break-before", 220, 8);
    testBoxPosition("after-break", 431, 8);
    testBoxPosition("no-break", 537, 8);
    checkTestFailures();
}
