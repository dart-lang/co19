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
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

const String htmlEL = r'''
<div style="-webkit-writing-mode: horizontal-bt;">
    <div id="scrollable" style="height: 100px; overflow: hidden;">
        <div style="height: 100px; width: 100px; background-color: silver;"></div>
        <div id="target" style="height: 100px; width: 100px; background-color: blue;"></div>
    </div>
</div>
<p id="result">
    FAIL: Test did not run.
</p>
''';

void main() {
    var body = document.body;
    body.setInnerHtml(htmlEL, treeSanitizer: new NullTreeSanitizer());
    var scrollable = document.getElementById("scrollable");
    scrollable.scrollTop = 40;
    var target = document.getElementById("target");
    var hitContainer = document.caretRangeFromPoint(208, 58).startContainer;
    Expect.equals(target, hitContainer);
    document.getElementById("result").text = "PASS";
}
