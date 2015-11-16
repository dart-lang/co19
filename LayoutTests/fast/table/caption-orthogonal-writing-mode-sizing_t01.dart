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
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
<style>
.table {
    display: table;
    height: 100px;
    width: 100px;
    border: 10px green solid;
    padding: 40px;
}

.caption {
    display: table-caption;
    -webkit-writing-mode: vertical-lr;
    height: 100%;
    width: 100%;
    background-color: navy;
}
</style>
''';

const String htmlEL2 = r'''
<p><a href="https://bugs.webkit.org/show_bug.cgi?id=103075">Bug 103075</a>: RenderBox::computePercentageLogicalHeight should use containingBlockLogicalWidthForContent</p>
<p>This test checks that a table caption with an orthogonal writing mode properly uses the table's logical width (including padding and borders).</p>
<div class="table">
    <div class="caption" data-expected-width="200" data-expected-height="100"></div>
</div>
<output id="output"></output>
''';

void runTest(e) {
    checkLayout(".tbl");//, document.getElementById("output"));
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    runTest(null);
//    window.onLoad.listen(runTest);
}
