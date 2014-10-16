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
<p>This test passes if you see a green box below.</p>

<div id="scrollable" style="height: 0; overflow-y: auto; padding-bottom: 200px; background-color: green">
  <div style="position: relative; height: 400px; background-color: red">
    <div id="node-to-hide" style="position: absolute;">hello</div>
  </div>
</div>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    document.body.offsetLeft;
    document.getElementById("node-to-hide").style.display = "none";
    document.getElementById("scrollable").scrollTop = 400;
    shouldBe(document.getElementById('scrollable').scrollTop, 400);
    shouldBe(document.getElementById('scrollable').scrollHeight, 600);
    checkTestFailures();
}
