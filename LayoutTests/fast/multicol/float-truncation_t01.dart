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

const String htmlEL1 = r'''
<style>
    div.columns {
        width: 200px;
        -webkit-columns: 2;
        -webkit-column-gap: 0;
        columns: 2;
        column-gap: 0;
        column-fill: auto;
        outline: 1px solid blue;
        font-family: Ahem;
        font-size: 10px;
        margin: 5px;
        overflow: hidden;
    }

    div.float {
        float: left;
        width: 51px;
        margin-top: 5px;
        color: silver;
    }
</style>
''';

const String htmlEL2 = r'''
<div id="tests">
    <div class="columns" style="height: 80px;">
        one line two lines three lines
        <div class="float" id="f1">
            three line float
        </div>
        text runs here next to the float
    </div>
    <!-- In this case, the float fits, but then the main content causes the break
         to occur earlier and the float gets split. -->
    <div class="columns" style="height: 75px;">
        one line two lines three lines
        <div class="float" id="f2">
            three line float
        </div>
        text runs here next to the float
    </div>
    <!-- In this case, the float paginates after its second line. -->
    <div class="columns" style="height: 70px;">
        one line two lines three lines
        <div class="float" id="f3">
            three line float
        </div>
        text runs here next to the float
    </div>
    <!-- In this case, the float paginates after its first line. -->
    <div class="columns" style="height: 70px;">
        one line two lines three lines and some more
        <div class="float" id="f4">
            three line float
        </div>
        text runs here next to the float
    </div>
    <!-- In this case, the float paginates after its third line. -->
    <div class="columns" style="height: 45px;">
        one line
        <div class="float" id="f5">
            and one five line float
        </div>
        text runs here next to the float
    </div>
</div>
''';

List<List> tests = [
    ["f1", 0, 45],
    ["f2", 0, 45],
    ["f3", 0, 45],
    ["f4", 0, 55],
    ["f5", 0, 15]
];

const String width = 'width', height = 'height';

Map floatOffset(float) {
    var range = document.createRange();
    range.setStart(float, 0);
    range.setEnd(float, 0);
    range.expand("word");
    var rect = range.getBoundingClientRect();
    var parentRect = float.parentNode.getBoundingClientRect();
    return { width: rect.left - parentRect.left, height: rect.top - parentRect.top  };
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    for (List test in tests) {
        var float = document.getElementById(test[0]);
        Map result = floatOffset(float);
        shouldBe(result[width], test[1], "$test width");
        shouldBe(result[height], test[2], "$test height");
    }
    checkTestFailures();
}
