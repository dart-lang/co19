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
import "../../testharness.dart";

const String htmlEL1 = r'''
''';

const String htmlEL2 = r'''
<div id="target" style="
    outline: dashed lightblue;
    -webkit-columns: 2;
    -webkit-column-gap: 0;
    columns: 2;
    column-gap: 0;
    column-fill: auto;
    width: 400px;
    height: 80px;
    font: 20px Ahem;
    line-height: 2;
">Lorem ipsum dolor sit amet</div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);

    // Clicking below the last line in the first column should not select anything from the first
    // line on the second column.
    var target = document.getElementById("target");
    var hitOffset = document.caretRangeFromPoint(target.offsetLeft + 190, target.offsetTop + 77).startOffset;
    shouldBe(hitOffset, 11, "target.offsetTop + 77");

    // Clicking above the first line in the second column should not snap to the beginning of the line.
    hitOffset = document.caretRangeFromPoint(target.offsetLeft + 250, target.offsetTop + 2).startOffset;
    shouldBe(hitOffset, 14, "target.offsetTop + 2");

    // Now test with a flipped lines writing mode.
    target.style.writingMode = "horizontal-bt";

    // Clicking above the last line in the first column should not select anything from the first
    // line on the second column.
    hitOffset = document.caretRangeFromPoint(target.offsetLeft + 190, target.offsetTop + 3).startOffset;
    shouldBe(hitOffset, 11, "target.offsetTop + 3");

    // Clicking below the first line in the second column should not snap to the beginning of the line.
    hitOffset = document.caretRangeFromPoint(target.offsetLeft + 250, target.offsetTop + 78).startOffset;
    shouldBe(hitOffset, 14, "target.offsetTop + 76");

    checkTestFailures();
}
