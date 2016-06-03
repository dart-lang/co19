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
import "../../../testharness.dart";

const String htmlEL1 = r'''
<style>
    div.box { -webkit-box-sizing: border; border: solid blue; }
    div.shorter { width: 54px; }
    div.taller { width: 72px; }
</style>
''';

const String htmlEL2 = r'''
<div style="width: 100px; height: 630px; -webkit-columns:6; -webkit-column-gap:5px; columns:6; column-gap:5px; column-fill:auto;">
    <div class="taller box"></div>
    <div class="taller box"></div>
    <div id="break-before" class="shorter box" style="-webkit-column-break-before: always; background-color:red"></div>
    <div class="shorter box" style="-webkit-column-break-after: always;"></div>
    <div id="after-break" class="shorter box" style=" background-color:green"></div>
    <div id="no-break" class="shorter box" style="-webkit-column-break-inside: avoid;"></div>
</div>
''';

void testBoxPosition(id, expectedLeft, expectedTop) {
    var rect = document.getElementById(id).getBoundingClientRect();
    var bodyRect = document.body.getBoundingClientRect();
    shouldBe(rect.left.round() - bodyRect.left.round(), expectedLeft, "left");
    shouldBe(rect.top.round() - bodyRect.top.round(), expectedTop, "top");
}

void main() {
//  <html style="-webkit-writing-mode:horizontal-tb">
    document.body.attributes["style"]="-webkit-writing-mode:vertical-rl; width:800px;";
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    testBoxPosition("break-before", 740, 212);
    testBoxPosition("after-break", 740, 423);
    checkTestFailures();
}
