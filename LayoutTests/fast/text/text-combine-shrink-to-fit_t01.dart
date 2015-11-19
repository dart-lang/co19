/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description
 * @needsreview the original test "LayoutTests/fast/text/text-combine-shrink-to-fit.html"
 * also fails on Crome and Firefox.
 */
import "dart:html";
import "../../testharness.dart";
import "../../resources/check-layout.dart";

const String htmlEL2 = r'''
The following vertical block should have one line, not two lines.
<div data-expected-width="26" id="test" style="font-family: Ahem; -webkit-writing-mode: vertical-rl; border: solid 5px blue;">
ab<span style="-webkit-text-combine: horizontal;">1</span>
</div>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    checkLayout('#test');
}
