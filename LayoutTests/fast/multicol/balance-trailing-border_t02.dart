/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Tests that the bottom border at a column boundary in a block
 * that lives in multiple columns is recorded properly for balancing.
 */
import "dart:html";
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
<p>There should be no space between the short black line and the long gray one.</p>
<div id="mc" style="-webkit-columns:3; columns:3; line-height:21px; orphans:1; widows:1; border-bottom:3px solid gray;">
    <div style="height:9px;"></div>
    <div style="border-bottom:3px solid black;">
        <br><br><br><br><br><br><br><br>
    </div>
</div>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    Element mc=document.getElementById("mc");
    Expect.equals(69, mc.offsetHeight);
}
