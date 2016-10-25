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
    width: 300px;
    font: 20px/1 Ahem;
    color: green;
}

#float {
    float: left;
    width: 100px;
    height: 100px;
    border-radius: 100px 0px;
    background-color: blue;
    background-clip: border-box;
    shape-outside: border-box;
}
</style>
''';

const String htmlEL2 = r'''
    <p>The green squares should follow the right side of the blue shape. They should not overlap the shape.</p>
    <div id="container">
        <div id="float"></div>
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

int borderXIntercept(y) {
    int radiusSquared = 100 * 100;
    int f = SubPixelLayout.snapToLayoutUnit(Math.sqrt(radiusSquared - y * y));
    return f + 20;  // will be compared with the right edge of a 20x20 Ahem char cell
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    shouldBe(elementRect('a').top, 0);
    shouldBe(elementRect('a').right, 120);

    shouldBe(elementRect('b').top, 20);
    TestCommon.shouldBeCloseTo(elementRect('b').right, borderXIntercept(20), 1);

    shouldBe(elementRect('c').top, 40);
    TestCommon.shouldBeCloseTo(elementRect('c').right, borderXIntercept(40), 1);

    shouldBe(elementRect('d').top, 60);
    TestCommon.shouldBeCloseTo(elementRect('d').right, borderXIntercept(60), 1);

    shouldBe(elementRect('e').top, 80);
    TestCommon.shouldBeCloseTo(elementRect('e').right, borderXIntercept(80), 1);

    shouldBe(elementRect('f').top, 100);
    shouldBe(elementRect('f').right, 20);

    checkTestFailures();
}
