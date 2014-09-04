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
<style>
    #target { background-color: red; }
    #target:hover { background-color: green; }
</style>
<div style="margin: 100px 0 0 92px; -webkit-writing-mode: horizontal-bt; height: 100px; width: 100px;">
    <div style="height: 100px;"></div>
    <div id="target" style="height: 50px;"></div>
</div>
<p>
    This tests hit-testing in the overflow area of flipped-blocks writing mode
    blocks.
</p>
<p>
    The red rectangle should turn green when you hover over it.
</p>
<p id="result">
</p>
''';

void main() {
    var body = document.body;
    body.setInnerHtml(htmlEL, treeSanitizer: new NullTreeSanitizer());
    var target = document.getElementById('target');
    var result = document.elementFromPoint(150, 75);
    Expect.equals(target, result);
}
