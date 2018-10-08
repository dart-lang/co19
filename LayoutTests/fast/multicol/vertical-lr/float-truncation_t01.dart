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

const String htmlEL1 = r'''
<style>
    div.columns {
        -webkit-columns: 2;
        -webkit-column-gap: 0;
        columns: 2;
        column-gap: 0;
        column-fill: auto;
        height: 200px;
        outline: 1px solid blue;
        font-family: Ahem;
        font-size: 10px;
        margin: 5px;
        overflow: hidden;
    }

    div.float {
        float: left;
        height: 51px;
        -webkit-margin-before: 5px;
        color: silver;
    }
</style>
''';

const String htmlEL2 = r'''
<div id="tests">
    <div class="columns" style="width: 80px;">
        one line two lines three lines
        <div class="float" id="f1">
            three line float
        </div>
        text runs here next to the float
    </div>
    <!-- In this case, the float fits, but then the main content causes the break
         to occur earlier and the float gets split. -->
    <div class="columns" style="width: 75px;">
        one line two lines three lines
        <div class="float" id="f2">
            three line float
        </div>
        text runs here next to the float
    </div>
    <!-- In this case, the float paginates after its second line. -->
    <div class="columns" style="width: 70px;">
        one line two lines three lines
        <div class="float" id="f3">
            three line float
        </div>
        text runs here next to the float
    </div>
    <!-- In this case, the float paginates after its first line. -->
    <div class="columns" style="width: 70px;">
        one line two lines three lines and some more
        <div class="float" id="f4">
            three line float
        </div>
        text runs here next to the float
    </div>
    <!-- In this case, the float paginates after its third line. -->
    <div class="columns" style="width: 45px;">
        one line
        <div class="float" id="f5">
            and one five line float
        </div>
        text runs here next to the float
    </div>
</div>
''';

const String width = "width", height = "height";

Map floatOffset(Element float) {
    Range range = document.createRange();
    range.setStart(float, 0);
    range.setEnd(float, 0);
    range.expand("word");
    Rectangle rect = range.getBoundingClientRect();
    Rectangle parentRect = (float.parentNode as Element).getBoundingClientRect();
    return { width: rect.left - parentRect.left, height: rect.top - parentRect.top  };
}

List<List> tests = [
    ["f1", 45, 0],
    ["f2", 45, 0],
    ["f3", 45, 0],
    ["f4", 55, 0],
    ["f5", 15, 0]
];

void main() {
    document.body.attributes["style"]="-webkit-writing-mode:vertical-lr";
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var test;
    var failures = 0;
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
