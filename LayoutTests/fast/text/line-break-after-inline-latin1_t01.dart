/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Line breaks after span inlines - Latin1
 */
import "../../testharness.dart";

const String htmlEL2 = r'''
<meta charset=utf-8>
<div>
<p>With span inline on first word, Latin1 in second position of second word.</p>
<p style="font-family:courier; font-size:15px; width: 25px"><span>xx</span> xéx</p>
<p>With span inline on first word, Latin1 in first position of second word.</p>
<p style="font-family:courier; font-size:15px; width: 25px"><span>xx</span> éxx</p>
<p>With span inline on first word, no Latin1 in second word.</p>
<p style="font-family:courier; font-size:15px; width: 25px"><span>xx</span> xxx</p>
<p>Without span, Latin1 in second position of second word.</p>
<p style="font-family:courier; font-size:15px; width: 25px">xx xéx</p>
<p>Without span, Latin1 in first position of second word.</p>
<p style="font-family:courier; font-size:15px; width: 25px">xx éxx</p>
<p>Without span, no Latin1 in second word.</p>
<p style="font-family:courier; font-size:15px; width: 25px">xx xxx</p>
</div>
<div><pre id=results></pre></div>
''';

List mergeRect(rects, rect) {
    var newRects = [];
    if (!rects.length) {
        newRects.add(rect);
    } else {
        for (var i = 0; i < rects.length; ++i) {
            var r = rects[i];
            if (!rect)
                newRects.add(r);
            else if (rect.top < r.top) {
                newRects.add(rect);
                newRects.add(r);
                rect = null;
            } else if (rect.top == r.top) {
                if (rect.left + rect.width > r.left + r.width)
                    r.width = rect.left + rect.width - r.left;
                newRects.add(r);
                rect = null;
            } else
                newRects.add(r);
        }
        if (rect)
            newRects.add(rect);
    }
    return newRects;
}

List mergeRects(rects, newRects) {
    for (var i = 0; i < newRects.length; ++i)
        rects = mergeRect(rects, newRects[i]);
    return rects;
}

List getLineRects(paragraphNumber) {
    var range = document.createRange();
    var paragraphs = document.getElementsByTagName("p");
    var p = paragraphs[paragraphNumber];
    var rects = [];
    for (var i = 0; i < p.childNodes.length; ++i) {
        range.setStart(p, i);
        range.setEnd(p, i + 1);                     
        rects = mergeRects(rects, range.getClientRects());
    }
    return rects;
}

void compareParagraphLineRects(paragraphNumber1, paragraphNumber2) {
    var rects1 = getLineRects(paragraphNumber1);
    var rects2 = getLineRects(paragraphNumber2);
//    print("$paragraphNumber1 $paragraphNumber2 rects1.length=${rects1.length}");
    if (rects1.length != rects2.length) {
        testFailed("different number of lines, got ${rects1.length}, expected ${rects2.length}");
    } else {
        for (int i = 0; i < rects1.length; ++i) {
            shouldBe(rects1[i].width, rects2[i].width,
                    'para[$paragraphNumber1] line[$i] width differs from para[$paragraphNumber2  line[$i]');
        }
    }
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    for (var i = 0; i < 3; i++ ) {
        compareParagraphLineRects(i*2 + 1, i*2 + 1 + 6);
    }
    checkTestFailures();
}