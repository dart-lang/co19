/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests that percent lengths of an absolutely positioned table is resolved
 * against the padding box of the parent.
 */
import "dart:html";
import "../../testharness.dart";
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
<style>
    div {
        position: relative;
        border: 5px solid black;
        height: 60px;
        width: 60px;
        padding: 20px;
        margin: 10px;
    }

    .tbl {
        display: table;
        background-color: skyblue;
        position: absolute;
        width: 50%;
        height: 50%;
    }

    .cell { display: table-cell; }

    .topleft { left: 0; top: 0; }
    .topright { right: 0; top: 0; }
    .bottomright { right: 0; bottom: 0; }
    .bottomleft { left: 0; bottom: 0; }

    .vertical  { -webkit-writing-mode: vertical-lr; }

</style>
''';

const String htmlEL2 = r'''
<p>Tests that percent lengths of an absolutely positioned table is resolved
against the <em>padding box</em> of the parent.
<hr>
<output id="output"></output>
<hr>
<div><span class="tbl topleft" data-expected-client-width=50 data-expected-client-height=50><span class="cell">abc</span></span></div>
<div><span class="tbl topright" data-expected-client-width=50 data-expected-client-height=50><span class="cell">abc</span></span></div>
<div><span class="tbl bottomright" data-expected-client-width=50 data-expected-client-height=50><span class="cell">abc</span></span></div>
<div><span class="tbl bottomleft" data-expected-client-width=50 data-expected-client-height=50><span class="cell">abc</span></span></div>

<div class="vertical"><span class="tbl topleft" data-expected-client-width=50 data-expected-client-height=50><span class="cell">abc</span></span></div>
<div class="vertical"><span class="tbl topright" data-expected-client-width=50 data-expected-client-height=50><span class="cell">abc</span></span></div>
<div class="vertical"><span class="tbl bottomright" data-expected-client-width=50 data-expected-client-height=50><span class="cell">abc</span></span></div>
<div class="vertical"><span class="tbl bottomleft" data-expected-client-width=50 data-expected-client-height=50><span class="cell">abc</span></span></div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    checkLayout(".tbl", document.getElementById("output"));
}
