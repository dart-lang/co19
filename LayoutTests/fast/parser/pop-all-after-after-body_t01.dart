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
import "../../testharness.dart";

const String htmlEL1 = r'''
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>last-child test</title>
''';

const String htmlEL2 = r'''
  <div id='last'>last</div>
''';

void runTest(e) {
    // Notice that this file lacks a terminating newline character!
    // That's essential to what this test is testing!
    Expect.equals(1, document.querySelectorAll('body>:last-child').length);
    print("test passed");
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    window.onLoad.listen(runTest);
}
