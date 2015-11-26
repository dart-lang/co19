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
<p>This test checks various characters that should always be zero width to ensure that they are when enclosed by complex script characters.
The WebKit text system ensures this in a way that's independent of the fonts installed on the system.</p>
<p id="result">FAIL: Script did not run to completion.</p>
<span id="characters">&#x0915;&#x093E;&#x0916;</span></p>
''';

int testChar(a, b, ch) {
    // Strings a and b selected here do not have any 'interaction' between them.
    var span = document.getElementById("characters");
    span.firstChild.data = a + b;
    var abWidth = span.offsetWidth;
    span.firstChild.data = a;
    var aWidth = span.offsetWidth;
    span.firstChild.data = a + new String.fromCharCode(ch) + b;
    var abWithChWidth = span.offsetWidth;

    if (abWithChWidth > abWidth)
        return 1;
    if (abWidth > aWidth)
        return 0;
    return 1;
}

int testWithZeroWidthSpace(String a, String b) {
    int failedCount=0;
    for (var i = 1; i < 32; ++i)
        if (i != 9 && i != 10 && i != 13)
            failedCount += testChar(a, b, i);

    for (var i = 0x7F; i < 0xA0; ++i)
        failedCount += testChar(a, b, i);
    failedCount += testChar(a, b, 0xAD);

    // ZWJ (U+200C) and ZWNJ (U+200D) are excluded because they
    // can affect the rendering in complex script text.
    failedCount += testChar(a, b, 0x200B);
    failedCount += testChar(a, b, 0x200E);
    failedCount += testChar(a, b, 0x200F);
    failedCount += testChar(a, b, 0x202A);
    failedCount += testChar(a, b, 0x202B);
    failedCount += testChar(a, b, 0x202C);
    failedCount += testChar(a, b, 0x202D);
    failedCount += testChar(a, b, 0x202E);
    failedCount += testChar(a, b, 0xFEFF);
    failedCount += testChar(a, b, 0xFFFC);

    return failedCount;
}

void runTests(e) {
    var failedDevanagariCount = testWithZeroWidthSpace("\u0915\u093E", "\u0916");

    var failedArabicCount = testWithZeroWidthSpace("\u0627\u0644\u0645\u062A\u0648\u0633\u0637\u0020\u200B\u200B\u0647\u0648\u0020\u0020", "\u0647\u0648\u0020");

    shouldBe(failedDevanagariCount, 0,
        "$failedDevanagariCount characters had non-zero width or failed to get measured when test with Devanagari");
    shouldBe(failedArabicCount, 0,
        "$failedArabicCount characters had non-zero width or failed to get measured when test with Arabic");

    checkTestFailures();
    document.getElementById("result").firstChild.text = "PASS: All characters had zero-width.";
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    window.onLoad.listen(runTests);
}
