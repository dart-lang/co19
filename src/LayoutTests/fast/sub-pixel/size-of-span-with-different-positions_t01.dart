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

const String htmlEL1 = r'''
<style>
    .testContent {
        font-face: Arial; font-size: 16px;
    }
</style>
''';

const String htmlEL2 = r'''
<div id="testContent">
    <span id="span-position-static"   style="position:static">T</span>
    <span id="span-position-fixed"    style="position:fixed">T</span>
    <span id="span-position-absolute" style="position:absolute">T</span>
    <span id="span-position-relative" style="position:relative">T</span>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);

    var testContent = document.getElementById("testContent");
    var spans = testContent.querySelectorAll('span');
    var expected_width = document.getElementById('span-position-static').getBoundingClientRect().width;
    // if expected_width is integral, all should match, otherwise should be close
    var tolerance = expected_width is int ? 0 : 1.0 / 60;

    Expect.approxEquals(expected_width, document.getElementById("span-position-fixed").getBoundingClientRect().width, tolerance, "span-position-fixed");
    Expect.approxEquals(expected_width, document.getElementById("span-position-absolute").getBoundingClientRect().width, tolerance, "span-position-absolute");
    Expect.approxEquals(expected_width, document.getElementById("span-position-relative").getBoundingClientRect().width, tolerance, "span-position-relative");
}
