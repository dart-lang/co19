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
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
<div style="font-size: 72px;">
    <span id="reference">e&#x0300;</span><span id="test">&#x1e17;e&#x0300;</span>
</div>
<div id="result">FAIL.</div>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var testEl = document.getElementById('test');

    var reference = document.getElementById("reference").firstChild;
    var referenceRange = document.createRange();
    referenceRange.setStart(reference, 0);
    referenceRange.setEnd(reference, 2);
    var referenceWidth = referenceRange.getBoundingClientRect().width;

    var test = document.getElementById("test").firstChild;
    var testRange = document.createRange();
    testRange.setStart(test, 1);
    testRange.setEnd(test, 3);
    var testWidth = testRange.getBoundingClientRect().width;

    Expect.isTrue((testWidth - referenceWidth).abs() <= 1);
    document.getElementById("result").text = "PASS";
}
