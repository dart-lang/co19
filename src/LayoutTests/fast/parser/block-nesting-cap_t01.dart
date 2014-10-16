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

void main() {
    description('Test that the HTML parser does not allow the nesting depth of elements to exceed 512.');
    
    var depth = 514;
    var markup = "";
    var i;
    for (i = 0; i < depth; ++i)
        markup += "<div id='d$i'>";
    var doc = document.implementation.createHtmlDocument("");
    doc.body.innerHtml = markup;
    
    var d510 = doc.getElementById("d510");
    var d511 = doc.getElementById("d511");
    var d512 = doc.getElementById("d512");
    
    shouldBe(d512.parentNode, d510, "d512.parentNode");
    shouldBe(d511.parentNode, d510, "d511.parentNode");
    shouldBe(d512.previousNode, d511, "d512.previousNode");

    checkTestFailures();
}
    