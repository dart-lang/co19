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

const String htmlEL2 = r'''
    <!-- Make a container with 9 lines. With three columns, that means three lines per column. -->
    <div style="-webkit-columns:3; columns:3; column-gap:1em; -webkit-column-gap:1em; width:32em; orphans:1; widows:1;">
        <br>
        <br>
        <br>
        <br>
        <br>
        <span id="elm">
            <!-- This is at a column boundary, where the first line fits in the second column, while
                 the second line is in the third column. -->
            XXXXXXXXXXXXXXXXXXXXXXXXXX
            XXXXXXXXXXXXXXXXXXXXXXXXXX
        </span><br>
        <br>
        <br>
    </div>
''';

void main() {
    document.body.attributes["style"]="margin-left:10px; margin-top:15px;";
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var rects = document.getElementById('elm').getClientRects();
    shouldBe(rects.length, 2);
    shouldBeTrue(rects[1].left > rects[0].left);
    shouldBeTrue(rects[0].top > rects[1].top);
    shouldBeTrue(rects[0].right - rects[0].left > 0);
    shouldBe(rects[1].right - rects[1].left, rects[0].right - rects[0].left);
    shouldBeTrue(rects[0].bottom - rects[0].top > 0);
    shouldBe(rects[1].bottom - rects[1].top, rects[0].bottom - rects[0].top);
    checkTestFailures();
}
