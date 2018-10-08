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
import "../../../testharness.dart";

const String htmlEL2 = r'''
<div id="tests" style="-webkit-column-count:2; -webkit-column-gap:0; column-count:2; column-gap:0; column-fill:auto; width:300px; height:600px;">
<div style="width:280px"></div>
<div id="f1" style="border:5px solid black; float:left">
<img style="display:block;height:140px;width:80px;">
</div>
</div>
<div id="result"></div>
''';

const String width = "width", height = "height";

Map floatOffset(Element float) {
    var parentRect = document.getElementById('tests').getBoundingClientRect();
    Rectangle rect = float.getBoundingClientRect();
    return { width: rect.left - parentRect.left, height: rect.top - parentRect.top  };
}

List<List> tests = [
    ["f1", 0, 300]
];

void main() {
    document.body.attributes["style"]="-webkit-writing-mode:vertical-lr";
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    for  (List test in tests) {
        Element float = document.getElementById(test[0]);
        Map result = floatOffset(float);
        float.style.color = "red";
        shouldBe(result[width], test[1], "width");
        shouldBe(result[height], test[2], "height");
        float.style.color = "green";
    }

    checkTestFailures();
}
