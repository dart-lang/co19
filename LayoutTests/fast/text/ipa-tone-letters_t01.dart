/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description
 */
import "../../testharness.dart";

const String htmlEL2 = r'''
<p>This test checks if sequences of IPA tone marks are treated as complex
   script characters and ligated when a font capable of that is specified
   regardless of text-rendering mode.
   It's for <a href="http://bugs.webkit.org/show_bug.cgi?id=39799">bug 39799</a>.
</p>
<p id="testArea" style="font-family: Arial;">
<span id="fastPath" style="text-rendering: optimizeSpeed"> </span>
<span id="slowPath" style="text-rendering: optimizeLegibility"> </span>
</p>
''';

var testStrings = ["\u02E5\u02E9", "\u02E9\u02E5", "\u02E7\u02E9",
                   "\u02E5\u02E7", "\u02E5\u02E7\u02E5"];

void testString(int i) {
    String s=testStrings[i];
    var fast = document.getElementById("fastPath");
    fast.firstChild.data = s;
    var fastWidth = fast.offsetWidth;
    var slow = document.getElementById("slowPath");
    slow.firstChild.data = s;
    var slowWidth = slow.offsetWidth;
    shouldBe(fastWidth, slowWidth, "testStrings[$i]=$s");
}

void doTest(e) {
    for (int i = 0; i < testStrings.length; ++i) {
        testString(i);
    }

    checkTestFailures();
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    window.onLoad.listen(doTest);
}
