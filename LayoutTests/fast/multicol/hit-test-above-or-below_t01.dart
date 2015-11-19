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

const String htmlEL1 = r'''
''';

const String htmlEL2 = r'''
<div style="margin: 50px; background-color: lightblue; width: 800px; height: 200px; -webkit-column-width:185px; -webkit-column-gap:15px; column-width:185px; column-gap:15px; column-fill:auto; font-family: Ahem; font-size: 50px; line-height: 1;">
    123<div style="background-color: blue; height: 70px;"></div>abc<br>def<div style="background-color: blue; height: 60px;"></div>ghi<br>jkl<div style="background-color: blue; height: 110px;"></div>mno</div>
<pre id="console" style="display: none;"></pre>
''';

String characterAtPoint(x, y) {
    Range range = document.caretRangeFromPoint(x, y);
    if (range.startContainer.nodeType != Node.TEXT_NODE)
        return null;
    Text startContainer=range.startContainer as Text;
    if (range.startOffset >= startContainer.length)
        return null;
    return startContainer.data[range.startOffset];
}

void test(x, y, character) {
    var actualCharacter = characterAtPoint(x, y);
    shouldBe(character, actualCharacter, "x=$x, y=$y");
}

void main() {
    document.body.attributes["style"]="margin: 0";
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    test(150, 25, "1");
    test(350, 25, "d");
    test(550, 25, "j");
    test(750, 25, "m");

    test(150, 275, "d");
    test(350, 275, "j");
    test(550, 275, "m");
    test(750, 275, null);

    test(150, 475, "d");
    test(350, 475, "j");
    test(550, 475, "m");
    test(750, 475, null);

    checkTestFailures();
}

