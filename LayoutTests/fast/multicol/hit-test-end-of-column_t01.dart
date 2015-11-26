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
<div id="target" style="
    outline: dashed lightblue;
    width: 400px;
    -webkit-columns: 2;
    -webkit-column-gap: 0;
    columns: 2;
    column-gap: 0;
    column-fill: auto;
    height: 90px;
    font: 20px Ahem;
">Lorem ipsum dolor sit amet consectetur elit.</div>
<p id="result">
    FAIL: Test did not run.
</p>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    // Clicking below the last line in the first column should not select anything from the first
    // line on the second column.
    var target = document.getElementById("target");
    var hitOffset = document.caretRangeFromPoint(target.offsetLeft + 45, target.offsetTop + 87).startOffset;
    Expect.isTrue(hitOffset == 26 || hitOffset == 24, "hitOffset = $hitOffset");
}