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
    height: 150px;
  }

#float-left {
    float: left;
    position: relative;
    overflow: visible;
    shape-outside: polygon(70px 20px, 120px 70px, 70px 120px, 20px 70px);
    shape-margin: 20px;
    width: 140px;
    height: 140px;
}

#svg-shape {
    position: absolute;
    display: block;
    top: 0px;
    left: 0px;
    width: 100px;
    height: 100px;
    margin: 20px;
}
</style>
''';

const String htmlEL2 = r'''
<div id="container">
    <div id="float-left">
        <svg id="svg-shape" xmlns="http://www.w3.org/2000/">
            <polygon points="50,0 100,50 50,100 0,50" fill="rgba(0,150,0, 0.5)"/>
        </svg>
    </div>
    <span id="l1">X</span></br><span id="l2">X</span><br/><span id="l3">X</span><br/><br/><span id="l4">X</span><br/><span id="l5">X</span><br/><span id="l6">X</span>
</div>
<div id="console"></div>
''';

Rectangle elementRect(elementId) {
    Rectangle s = document.getElementById("container").getBoundingClientRect();
    Rectangle r = document.getElementById(elementId).getBoundingClientRect();
    return new Rectangle(r.left - s.left, r.top - s.top, r.width, r.height);
}

// The shape-outside polygon's X and Y coordinates are 20, 70, 120, specified relative to the
// "float-left" element. Its shape-marign is 20px, which means that the X and Y limits of the
// margin boundary are 0, and 140. This is because the margin boundary has circular arc segments
// at the vertices, i.e. it's a rounded rectangle rotated by 45 degrees. None of the character
// positions in this test are defined by the arc segments.
//
// The left edge of the (20px square) Ahem character on the first "l1" line (y == 20) is:
// 20 + (20*sqrt(2) + 50) = 98.28. The second and third lines, "l2" and "l3" are similar, each
// one begins 20 pixels farther to the right. The left edges of "l4-l6" are the same as the first three,
// just in reverse order.

int marginLeftXIntercept(lineNumber) {
    var f = SubPixelLayout.snapToLayoutUnit(lineNumber * 20 + 20 * Math.sqrt(2) + 50);
    return f.round();
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var quiet = true; // PASS output depends on SubPixelLayout.isEnabled()

    shouldBe(elementRect('l1').top, 0);
    TestCommon.shouldBeCloseTo(elementRect('l1').left, marginLeftXIntercept(1), 1);

    shouldBe(elementRect('l2').top, 20);
    TestCommon.shouldBeCloseTo(elementRect('l2').left, marginLeftXIntercept(2), 1);

    shouldBe(elementRect('l3').top, 40);
    TestCommon.shouldBeCloseTo(elementRect('l3').left, marginLeftXIntercept(3), 1);

    shouldBe(elementRect('l4').top, 80);
    TestCommon.shouldBeCloseTo(elementRect('l4').left, marginLeftXIntercept(3), 1);

    shouldBe(elementRect('l5').top, 100);
    TestCommon.shouldBeCloseTo(elementRect('l5').left, marginLeftXIntercept(2), 1);

    shouldBe(elementRect('l6').top, 120);
    TestCommon.shouldBeCloseTo(elementRect('l6').left, marginLeftXIntercept(1), 1);

    checkTestFailures();
}
