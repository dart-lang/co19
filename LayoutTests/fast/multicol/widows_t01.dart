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
<p>The 5 lines should all be in the second column.</p>
<div id="mc" style="-webkit-columns:3; columns:3; -webkit-column-rule:solid; line-height:50px; orphans:1; widows:5;">
    <span id="inFirstColumn"><br></span>
    <span id="first">line<br></span>
    line<br>
    line<br>
    line<br>
    <span id="last">line<br></span>
</div>
''';

void main() {
    description("Test column balancer behavior when widows requirements are high, and there's need for an early break to honor widows");
    document.body.appendHtml(htmlEL2);
    
    var mc=document.getElementById("mc");
    var inFirstColumn=document.getElementById("inFirstColumn");
    var first=document.getElementById("first");
    var last=document.getElementById("last");

    shouldBe(mc.offsetHeight, 250, "mc.offsetHeight");
    shouldBe(first.offsetTop, inFirstColumn.offsetTop, "offsetTop");
    shouldBeTrue(first.offsetLeft > inFirstColumn.offsetLeft, "offsetLeft 1");
    shouldBe(last.offsetLeft, first.offsetLeft, "offsetLeft 2");
    
    checkTestFailures();
}
