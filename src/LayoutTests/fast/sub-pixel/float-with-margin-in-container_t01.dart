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

const String htmlEL2 = r'''
<p>
    Should not wrap when zooming out.
</p>
<div style="width: 100px;">
    <div id="col-a" style="width: 20px; margin-right: 1px; float: left; background: blue;">A</div>
    <div style="float: left;">
        <div id="col-b" style="width: 79px; background: green;">B</div>
    </div>
</div>
''';

void main() {
    document.body.appendHtml(htmlEL2);

    var elementA = document.getElementById('col-a');
    var elementB = document.getElementById('col-b');
    for (int zoom = 5; zoom <= 100; zoom += 5) {
        document.body.style.zoom = (zoom / 100).toString();
        shouldBe(elementA.getBoundingClientRect().top, elementB.getBoundingClientRect().top, "zoom=$zoom");
    }

    checkTestFailures();
}
