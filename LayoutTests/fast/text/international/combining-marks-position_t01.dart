/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description This test ensures that combining marks apper over the previous (or next)
 * character by comparing the length of words (one has marks, and the other doesn't have marks).
 */
import "dart:html";
import "../../../testharness.dart";
import "../../../../Utils/expect.dart";

const String htmlEL1 = r'''
<meta charset="utf-8" />
''';

const String htmlEL2 = r'''
<p>
This test ensures that combining marks apper over the previous (or next) character by comparing the length of
words (one has marks, and the other doesn't have marks).
</p>

<div style="font-family: arial; text-rendering: optimizeLegibility;">
<span id="reference1">test проверка</span>
</div>
<div style="font-family: arial;">
<span id="target1">te&#768;st прове&#768;рка</span>
</div>

<div>
<span id="reference2">خانه</span>
</div>
<div>
<span id="target2">خانهٔ</span>
</div>

<div id="result"></div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var reference1 = document.getElementById('reference1');
    var target1 = document.getElementById('target1');
    var reference2 = document.getElementById('reference2');
    var target2 = document.getElementById('target2');
    var result = document.getElementById('result');

    // Ignore a slight diff of the width between target and reference.
    var diff1 = (reference1.offsetWidth - target1.offsetWidth).abs();
    var diff2 = (reference2.offsetWidth - target2.offsetWidth).abs();
    Expect.isTrue(diff1 < 3 && diff2 < 3, '''
                           reference1.offsetWidth = ${reference1.offsetWidth}
                           target1.offsetWidth = ${target1.offsetWidth}
                           reference2.offsetWidth = ${reference2.offsetWidth}
                           target2.offsetWidth = ${target2.offsetWidth}
                           ''');
}
