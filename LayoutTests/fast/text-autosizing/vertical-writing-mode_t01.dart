/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description This test passes if this text is autosized.
 */
import "dart:html";
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<meta name="viewport" content="width=800">
<style>
html {
  font-size: 16px;
}
body {
  -webkit-direction: ltr;
  -webkit-writing-mode: vertical-rl;
  width: 800px;
  margin: 0;
  overflow-y: hidden;
}
</style>
''';

const String htmlEL2 = r'''
<div id="autosize">
    This test passes if this text is autosized. <br/>
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</div>
''';

void runTest(e) {
    var autosizeContainer = document.getElementById('autosize');
    var forceLayout = autosizeContainer.offsetWidth;
    String fontSize = autosizeContainer.getComputedStyle().fontSize;
    fontSize=fontSize.substring(0, fontSize.length-2); // remove "px" at end
    var computedFontSize = int.parse(fontSize);
    Expect.isTrue(computedFontSize > 16, "Expected a font size above 16, got $computedFontSize");
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    window.onLoad.listen(runTest);
}
