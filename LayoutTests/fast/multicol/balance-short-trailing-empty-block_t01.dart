/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Tests that a block a column boundary is recorded properly for balancing
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL2 = r'''
<p>Both words below should be in the the right column.</p>
<div id="console"></div>
<div id="mc" style="-webkit-columns:2; columns:2; orphans:1; widows:1; -webkit-column-rule:1px solid; column-rule:1px solid; background:olive;">
    <div style="height:120px;"></div>
    <div style="line-height:80px;">right<br>column</div>
    <div style="height:30px;"></div>
</div>
''';

void main() {
    document.body.setInnerHtml(htmlEL2, treeSanitizer:new NullTreeSanitizer());
    Element mc=document.getElementById("mc");
    Expect.equals(190, mc.offsetHeight);
}
