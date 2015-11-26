/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description This test checks various characters that should always be zero width to ensure that they are.
 * The WebKit text system ensures this in a way that's independent of the fonts installed on the system.
 */
import "dart:html";
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
<p>This test checks various characters that should always be zero width to ensure that they are.
The WebKit text system ensures this in a way that's independent of the fonts installed on the system.</p>
<p id="result">FAIL: Script did not run to completion.</p>
<p id="testArea"><span id="characters">ab</span></p>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var testString = "";
    for (var i = 0; i < 32; ++i) // >
        if (i != 9 && i != 10 && i != 13) // ;
            testString += new String.fromCharCode(i);
    testString += new String.fromCharCode(0x200B);
    testString += new String.fromCharCode(0x200C);
    testString += new String.fromCharCode(0x200D);
    testString += new String.fromCharCode(0x200E);
    testString += new String.fromCharCode(0x200F);
    testString += new String.fromCharCode(0xFEFF);
    testString += new String.fromCharCode(0xFFFC);
    var span = document.getElementById("characters");
    var abWidth = span.offsetWidth;
    span.firstChild.data = "a";
    var aWidth = span.offsetWidth;
    span.firstChild.data = "a" + testString + "b";
    var abWithCharactersWidth = span.offsetWidth;

    var testArea = document.getElementById("testArea");
    testArea.remove();

    Expect.isFalse(abWithCharactersWidth > abWidth,
        "One or more of the characters had a non-zero width.");
    Expect.isTrue(abWidth > aWidth,
        "Width measurement seems to have failed.");
    document.getElementById("result").firstChild.text = "PASS: All the characters had zero width.";
}
