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
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL1 = '''
    <link rel="stylesheet" href="$testSuiteRoot/fast/loader/resources/stylesheet.css">
''';

const String htmlEL2 = r'''
    <p>Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=17328">Bug
    17328: REGRESSION (r30147): Inspector is unstyled on Windows</a>. Testing
    that a local <tt>.css</tt> file is allowed as a stylesheet in strict
    mode.</p>
    <p id="target"></p>
''';

void runTest(e) {
    var target = document.getElementById("target");
    var style = target.getComputedStyle();
    Expect.equals("relative", style.position);
    asyncEnd();
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    asyncStart();
    window.onLoad.listen(runTest);
}
