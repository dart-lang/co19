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
import "../../../testcommon.dart" as TestCommon;

const String htmlEL1 = r'''
<style>
    #image-shape {
        float: right;
        shape-outside: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='250px' height='100px'><rect x='50' y='50' width='200' height='50' fill='blue'/></svg>");
        shape-margin: 50px;
        shape-image-threshold: 0;
        background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg'><rect x='0' y='0' width='300' height='150' rx='50' ry='50' fill='blue'/></svg>");
        background-repeat: no-repeat;
        width: 300px;
        height: 250px;
    }

    #content {
        font: 25px/1 Ahem, sans-serif;
        color: green;
        text-align: right;
    }
</style>
''';

const String htmlEL2 = r'''
  <p>This test requires the Ahem font. The green content should wrap around the blue rounded rectangle.</p>
  <div id="content">
      <div id="image-shape"></div>
      <span id="a">X</span><br><br><span id="b">X</span><br><span id="c">X</span><br><br><span id="d">X</span><br><span id="e">XXXX</span>
  </div>
  <div id="console"></div>
''';

Rectangle imageShapeRect(elementId) {
    Rectangle s = document.getElementById("image-shape").getBoundingClientRect();
    Rectangle r = document.getElementById(elementId).getBoundingClientRect();
    return new Rectangle(s.right - r.right - r.width, r.top - s.top, r.width, r.height);
}

void runTest(e) {
    shouldBe(imageShapeRect('a').top, 0);
    TestCommon.shouldBeCloseTo(imageShapeRect('a').right, 292, 1);

    shouldBe(imageShapeRect('b').top, 50);
    shouldBe(imageShapeRect('b').right, 300);

    shouldBe(imageShapeRect('c').top, 75);
    shouldBe(imageShapeRect('c').right, 300);

    shouldBe(imageShapeRect('d').top, 125);
    TestCommon.shouldBeCloseTo(imageShapeRect('d').right, 292, 1);

    shouldBe(imageShapeRect('e').top, 150);
    shouldBe(imageShapeRect('e').right, 0);

    checkTestFailures();
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    TestCommon.addOnLoadListener((_) {
        runTest(_);
    });
}
