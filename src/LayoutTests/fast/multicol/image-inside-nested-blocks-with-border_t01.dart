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
<div id="tests" style="-webkit-column-count:2; -webkit-column-gap:0; column-count:2; column-gap:0; column-fill:auto; height:300px; width:600px;">
<div style="height:280px"></div>
<div id="f1" style="border:5px solid black; float:left">
<img style="display:block;width:140px;height:80px;">
</div>
</div>
''';

const String width = "width", height="height";

var tests = [
    ["f1", 300, 0]
];

Map floatOffset(float) {
    var parentRect = document.getElementById('tests').getBoundingClientRect();
    var rect = float.getBoundingClientRect();
    return { width: rect.left - parentRect.left, height: rect.top - parentRect.top  };
}

void main() {
    document.body.appendHtml(htmlEL2);
    for (List test in tests) {
        var float = document.getElementById(test[0]);
        var result = floatOffset(float);
        shouldBe(result[width], test[1], "$test width");
        shouldBe(result[height], test[2], "$test height");
    }
    checkTestFailures();
}
