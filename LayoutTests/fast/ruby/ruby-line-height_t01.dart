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

String getLineHeight(id) {
    var element = document.getElementById(id);
    Expect.isNotNull(element, "id=$id");
    String lineHeight = element.getComputedStyle(null).getPropertyValue("line-height");
    return lineHeight;
}

void main() {
    description("Test that the CSS property 'line-height' is not applied to ruby base and annotation texts.");
    var div = document.createElement("div");
    div.setInnerHtml("<p style='line-height: 300%' id='p'>The line height of this is <ruby id='r'>three times normal<rt id='t'>&quot;line-height: 48px;&quot;</rt></ruby>, but the ruby should have 'line-height: normal'.</p>",
        treeSanitizer: new NullTreeSanitizer());
    document.body.append(div);
    
    shouldBe(getLineHeight('p'), "48px");
    shouldBe(getLineHeight('r'), "normal");
    shouldBe(getLineHeight('t'), "normal");
    checkTestFailures();
}
