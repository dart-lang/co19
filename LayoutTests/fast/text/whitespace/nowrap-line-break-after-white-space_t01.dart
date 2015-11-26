/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description This tests that <tt>-webkit-line-break: after-white-space</tt>
 *  trailing space truncation is not applied to text that does not auto-wrap.
 */
import "dart:html";
import "../../../testharness.dart";
import "../../../../Utils/expect.dart";

const String htmlEL2 = r'''
<p>
    This tests that <tt>-webkit-line-break: after-white-space</tt>
    trailing space truncation is not applied to text that does not auto-wrap.
</p>
<p>
    This box should have an active horizontal scrollbar, allowing the text to
    be scrolled to the left, making the trailing space on the right visible.
</p>
<div id="target" style="border: solid; width: 100px; white-space: nowrap; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space; overflow-x: scroll;">
    Lorem ipsum dolor sit amet&nbsp;&nbsp;&nbsp;
</div>
<div id="reference" style="float: left;">
    Lorem ipsum dolor sit amet&nbsp;&nbsp;&nbsp;
</div>
<div id="result">
test did not run
</div>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var target = document.getElementById("target");
    var reference = document.getElementById("reference");
    var result = document.getElementById("result");

    var referenceWidth = reference.offsetWidth;
    reference.style.display = "none";

    var scrollWidth = target.scrollWidth;

    bool passed = (scrollWidth - referenceWidth).abs() <= 1;
    result.text = passed ? "PASS" : "FAIL";
    Expect.isTrue(passed, "expected:$referenceWidth, actual:$scrollWidth");
}
