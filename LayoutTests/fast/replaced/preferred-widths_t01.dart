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
.container {
    display: inline-block;
    border: 5px solid salmon;
}
.min-content {
    min-width: -webkit-min-content;
    min-width: -moz-min-content;
    min-width: -ie-min-content;
    min-width: min-content;
}
.max-content {
    min-width: -webkit-max-content;
    min-width: -moz-max-content;
    min-width: -ie-max-content;
    min-width: max-content;
}
</style>
''';

const String htmlEL2 = r'''
<p>Test the effect of percentages widths on the preferred widths of replaced elements.</p>

<div style="width: 0; position: relative">

<div class="container" data-expected-width=130 data-expected-height=130>
    <img class="min-content" src="resources/square-blue-100x100.png" style="width: 10px; border: 5px solid black; padding: 5px;" data-expected-width=120 data-expected-height=120>
</div>

<div class="container" data-expected-width=130 data-expected-height=130>
    <img class="max-content" src="resources/square-blue-100x100.png" style="width: 10px; border: 5px solid black; padding: 5px;" data-expected-width=120 data-expected-height=120>
</div>

<div class="container" data-expected-width=130 data-expected-height=130>
    <img class="min-content" src="resources/square-blue-100x100.png" style="width: 100%; border: 5px solid black; padding: 5px;" data-expected-width=120 data-expected-height=120>
</div>

<div class="container" data-expected-width=130 data-expected-height=130>
    <img class="max-content" src="resources/square-blue-100x100.png" style="width: 100%; border: 5px solid black; padding: 5px;" data-expected-width=120 data-expected-height=120>
</div>

<div class="container" data-expected-width=55 data-expected-height=75>
    <img src="resources/square-blue-100x100.png" style="min-width: 25px; width: 100%; border: 5px solid black; padding: 5px;" data-expected-width=65 data-expected-height=65>
</div>

<div class="container" data-expected-width=55 data-expected-height=75>
    <img src="resources/square-blue-100x100.png" style="min-width: 25px; width: 100%; border: 5px solid black; padding: 5px;" data-expected-width=65 data-expected-height=65>
</div>

<div class="container" data-expected-width=30 data-expected-height=50>
    <img src="resources/square-blue-100x100.png" style="width: 100%; border: 5px solid grey; padding: 5px;" data-expected-width=40 data-expected-height=40>
</div>

<div class="container" data-expected-width=30 data-expected-height=50>
    <img src="resources/square-blue-100x100.png" style="max-width: 100%; border: 5px solid grey; padding: 5px;" data-expected-width=40 data-expected-height=40>
</div>

<div class="container" data-expected-width=130 data-expected-height=150>
    <img src="resources/square-blue-100x100.png" style="min-width: 100%; border: 5px solid grey; padding: 5px;" data-expected-width=140 data-expected-height=140>
</div>

</div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    // Need to do this onload to make sure all the images have loaded.
    window.onLoad.listen((e) {
        checkLayout(".container");
    });
}
