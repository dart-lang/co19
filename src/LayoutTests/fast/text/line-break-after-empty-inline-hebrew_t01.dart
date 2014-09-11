/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Line breaks after empty inline - Hebrew
 */
import "../../testharness.dart";

const String htmlEL1 = r'''
<meta charset=utf-8>
''';

const String htmlEL2 = r'''
<div>
The following two paragraphs should have the same line breaks:
</div>
<div style="width: 40px; font-family: raanana;">
<p style="border:solid green 1px;">&#x05d0;&#x05d1;&#x05d2; &#x05d3;&#x05d4;&#x05d5; &#x05d6;&#x05d7;&#x05d8;</p>
<p style="border:solid green 1px;">&#x05d0;&#x05d1;&#x05d2; <span></span> &#x05d3;&#x05d4;&#x05d5; &#x05d6;&#x05d7;&#x05d8;</p>
</div>
''';

List getLineWidths(paragraphNumber) {
    var range = document.createRange();
    var paragraphs = document.getElementsByTagName("p");
    var p = paragraphs[paragraphNumber];
    range.setStart(p, 0);
    range.setEnd(p,p.childNodes.length);
    var rects = range.getClientRects();
    var widths = [];
    for (var i = 0; i < rects.length; ++i) {
        var r = rects[i];
        if (r.width != 0)
            widths.add(r.width);
    }
    return widths;
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    var widths1 = getLineWidths(0);
    var widths2 = getLineWidths(1);
    if (widths1.length != widths2.length) {
        testFailed("different number of lines, got ${widths2.length}, expected ${widths1.length}");
    } else {
        for (var i = 0; i < widths1.length; ++i) {
            shouldBe(widths2[i], widths1[i], "line[$i] width differs");
        } 
    }
    checkTestFailures();
}