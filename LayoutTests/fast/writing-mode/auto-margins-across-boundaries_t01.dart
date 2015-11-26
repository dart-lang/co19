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

const String htmlEL1 = r'''
<style>
.lr { -webkit-writing-mode: vertical-lr; background-color:green; margin-left:auto; margin-right:auto; width:100px; height:100px; }
</style>
''';

const String htmlEL2 = r'''
The green LR block should be centered horizontally within the black-bordered block.
<div style="width:300px; height:100px;border:2px solid black">
<div class="lr" id="test"></div>
</div>
<div id="console"></div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var test = document.getElementById("test");
    var rect = test.getBoundingClientRect();
    Expect.equals(110, rect.left);
}