/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests text with characters that have multiple glyphs.
 */
import "../../testharness.dart";

const String htmlEL2 = '''
<div id="target" style="font-size: 48px;"><span>[</span>&#x0E04;&#x0E33;&#x0E1C;<span>]</span></div>
<div id="reference" style="font-size: 48px;"><span>[</span>&#x0E04;&#x0E33;<span>]</span></div>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    var target = document.getElementById("target");

    var textNodeTarget = target.firstChild.nextNode;
    var range = document.createRange();
    range.setStart(textNodeTarget, 0);
    range.setEnd(textNodeTarget, 2);
    var targetWidth = range.getClientRects()[0].width;

    var reference = document.getElementById("reference");
    var textNodeReference = reference.firstChild.nextNode;
    range.setStart(textNodeReference, 0);
    range.setEnd(textNodeReference, 2);
    
    var referenceWidth = range.getClientRects()[0].width;

    Expect.isTrue((targetWidth - referenceWidth).abs() <= 1, "width was $targetWidth instead of $referenceWidth");
}