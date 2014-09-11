/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests text selection in complex scripts where glyph reordering occurs.
 */
import "../../testharness.dart";

const String htmlEL2 = r'''
<p>
    This tests text selection in complex scripts where glyph reordering occurs.
</p>
<div id="target" style="font-size: 48px;"><span>[</span>&#x0939;&#x093F;&#x0928;&#x094D;&#x0926;&#x0940;<span>]</span></div>
<div id="reference" style="font-size: 48px;"><span>[</span>&#x0928;&#x094D;&#x0926;&#x0940;<span>]</span></div>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    var target = document.getElementById("target");

    var textNode = target.firstChild.nextNode;
    var range = document.createRange();
    range.setStart(textNode, 0);
    range.setEnd(textNode, 2);
    var width = range.getClientRects()[0].width;

    range.setStart(target, 0);
    range.setEnd(target, 3);
    var totalWidth = range.getBoundingClientRect().width;

    var reference = document.getElementById("reference");
    range.setStart(reference, 0);
    range.setEnd(reference, 3);
    var referenceWidth = totalWidth - range.getBoundingClientRect().width;
    
    var delta = (width - referenceWidth).abs();
    Expect.isTrue(delta < 0.5, "width was $width instead of $referenceWidth");
}   