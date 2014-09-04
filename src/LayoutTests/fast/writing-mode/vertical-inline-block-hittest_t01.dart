/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test that we can click 2nd line inside inline-block in vertical writing mode.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

const String htmlEL2 = r'''
<body style="margin: 0px">
<div id="target" style="-webkit-writing-mode: vertical-rl; border: solid 1px black; font-family: Ahem">
<br />
<span style="display: inline-block"><a>b</a></span>
</div>
</body>
''';

function doTest() {
    var height = document.getElementById("test").offsetHeight;
    // If the units per em in the font is not respected, the height of the
    // test div will be much smaller than 25*7.
    Expect.equals(25*7, height);
}

void main() {
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    document.body.style.margin="0px"; // why attr in htmlEL2 does not work?
    var elementInsideInlineBlockInSecondLine = document.querySelector("a");
    Expect.equals(elementInsideInlineBlockInSecondLine, document.elementFromPoint(5, 5));
    document.getElementById("target").style.display = "none";
}
