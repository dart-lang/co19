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
import "../../resources/check-layout.dart";

const String htmlEL2 = r'''
<p>Bug <a href="https://bugs.webkit.org/show_bug.cgi?id=88676">88676</a>: Crash in FixedTableLayout::layout</p>
<p id="console">FAILED, the test didn't run.</p>
<table id="table">
    <tbody>
        <tr></tr>
    </tbody>
    <colgroup id="colGroup"></colgroup>
</table>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    document.body.offsetTop;
    Element colGroup=document.getElementById("colGroup");
    colGroup.remove();
    document.getElementById("console").text = "PASSED, the test didn't crash.";
}
