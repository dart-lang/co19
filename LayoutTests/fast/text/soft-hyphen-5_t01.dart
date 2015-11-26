/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Soft Hyphen Test
 */
import "../../testharness.dart";

const String htmlEL1 = r'''
<meta charset="utf-8">
''';

const String htmlEL2 = r'''
<div id="text1" style="width:150px; font-family:Ahem; font-size:14px; border:2px solid red">
    <p>anti&shy;dis&shy;est&shy;ab&shy;lish&shy;ment&shy;arian&shy;ism.</p>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    window.onLoad.listen((e) {
        // 56 is 4 * the font size (14). We're expecting the text to break up into 4 lines.
        // 4 lines + the padding gives a div height of 92 in webkit and FF, 88 in chrome.
        // So anything less than 56 is a FAIL.
        bool doesItPass = document.getElementById('text1').offsetHeight > 56;
        Expect.isTrue(doesItPass);
    });
}
