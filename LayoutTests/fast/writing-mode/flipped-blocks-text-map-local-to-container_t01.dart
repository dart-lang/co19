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
<meta name=viewport content="width=device-width">
<div style="border: solid; -webkit-writing-mode: horizontal-bt; -webkit-logical-width: 200px; -webkit-logical-height: 400px;
    font-size: 36px; line-height: 2;
">
    Lorem ipsum dolor <span id="target">sit</span> amet consectetur adipiscing elit.
</div>
<p id="result">
    FAIL: Test did not run.
</p>
''';

void main() {
    var body = document.body;
    body.setInnerHtml(htmlEL, treeSanitizer: new NullTreeSanitizer());
    var target = document.getElementById("target");
    var range = document.createRange();
    range.selectNode(target.firstChild);
    var textTop = range.getClientRects()[0].top;
    range.selectNode(target);
    var spanTop = range.getClientRects()[0].top;
    Expect.equals(textTop, spanTop);
    document.getElementById("result").text = "PASS";
}
