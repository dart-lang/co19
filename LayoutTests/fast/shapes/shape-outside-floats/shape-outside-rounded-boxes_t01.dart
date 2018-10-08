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
import "dart:math" as Math;
import "../../../testharness.dart";
import "../resources/subpixel-utils.dart" as SubPixelLayout;
import "../../../testcommon.dart" as TestCommon;

const String htmlEL1 = r'''
<style>
#container {
    font: 20px/1 Ahem, sans-serif;
    width: 200px;
    height: 120px;
    color: rgba(0,0,200, 0.25);
    margin: 25px;
    background-color: grey;
}

#left-border-box {
    float: left;
    border-top-right-radius: 100px 30px;
    border-bottom-right-radius: 100px 30px;
    shape-outside: border-box;  
    width: 100px;
    height: 80px;
    margin-top: 20px;
    margin-bottom: 20px;
    background-color: blue;
    background-clip: border-box;
}
</style>
''';

const String htmlEL2 = r'''
    <div id="container">
        <div id="left-border-box"></div>
        <span id="a">X</span><br>
        <span id="b">X</span><br>
        <span id="c">X</span><br>
        <span id="d">X</span><br>
        <span id="e">X</span><br>
        <span id="f">X</span>
    </div>
    <div id="console"></div>
''';

Rectangle elementRect(elementId) {
    Rectangle s = document.getElementById("container").getBoundingClientRect();
    Rectangle r = document.getElementById(elementId).getBoundingClientRect();
    return new Rectangle(r.left - s.left, r.top - s.top, r.width, r.height);
}

// You'll find the equation for the X intercept of an elliptical arc here (among other places):
// http://hansmuller-webkit.blogspot.com/2012/07/computing-horizonal-rounded-rectangle.html
int cornerEllipseRightXIntercept(y, cx, rx, ry) {
    return SubPixelLayout.snapToLayoutUnit(cx + rx * Math.sqrt(1 - Math.pow((ry - y) / ry, 2)));
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    shouldBe(elementRect('a').top, 0);
    shouldBe(elementRect('a').left, 0);

    shouldBe(elementRect('b').top, 20);
    TestCommon.shouldBeCloseTo(elementRect('b').left, cornerEllipseRightXIntercept(40, 0, 100, 30), SubPixelLayout.resolution());

    shouldBe(elementRect('c').top, 40);
    shouldBe(elementRect('c').left, 100);

    shouldBe(elementRect('d').top, 60);
    shouldBe(elementRect('d').left, 100);

    shouldBe(elementRect('e').top, 80);
    TestCommon.shouldBeCloseTo(elementRect('e').left, cornerEllipseRightXIntercept(40, 0, 100, 30), SubPixelLayout.resolution());

    shouldBe(elementRect('f').top, 100);
    shouldBe(elementRect('f').left, 0);

    checkTestFailures();
}
