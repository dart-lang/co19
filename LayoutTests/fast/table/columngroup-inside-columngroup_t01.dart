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
<p>Test for bug <a href="http://webkit.org/b/87314">87314</a>: Crash in RenderTableCol::nextColumn</p>
<table>
    <colgroup>
    </colgroup>
    <tbody>
        <td></td>
    </tbody>
</table>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var colgroup = document.createElement("colgroup");
    document.getElementsByTagName("colgroup")[0].append(colgroup);
    document.body.offsetTop;
    document.body.append(new Text("PASSED, this test didn't crash or ASSERT."));
}
