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

const String htmlEL2 = r'''
    <p>
        Test for <i><a href="rdar://problem/7215132">rdar://problem/7215132</a>,
        <a href="https://bugs.webkit.org/show_bug.cgi?id=29167">bug 29167</a>,
        REGRESSION (r48064): mint.com loses scrollbars after coming out of edit mode</i>,
        and <i><a href="rdar://problem/7314421">rdar://problem/7314421</a>,
        <a href="https://bugs.webkit.org/show_bug.cgi?id=30517">bug 30517</a>,
        REGRESSION (r48064): Extra scroll bars in GarageBand Lesson Store</i>.
    </p>
    <p>
        This tests that after setting 'overflow' on the document element to
        'hidden' and back to 'visible', scrollbars appear as necessary.
    </p>
    <p id="result">FAIL: Test did not run to completion</p>
''';

void main() {
    document.body.appendHtml(htmlEL2);
 
    document.documentElement.style.overflow = "hidden";
    document.body.offsetTop;
    document.documentElement.style.removeProperty("overflow");
    document.body.style.height = "200%";
    Expect.notEquals(document.documentElement.offsetWidth, window.innerWidth,
        "Scrollbar did not appear after resetting 'overflow'");
    document.getElementById("result").innerHtml = "PASS";
}