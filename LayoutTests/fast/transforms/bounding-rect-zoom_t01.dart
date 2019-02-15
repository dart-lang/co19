/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Tests that these functions account for full page zoom.
 * There should be no red visible.
 */
import "dart:html";
import "../../testcommon.dart" as tc;
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
<p>Tests that these functions account for full page zoom.<br>There should be no red visible.</p>

<table width="100%"><tr><td width="200px">getClientBoundingRect():

<div id="baseline1" style="position:absolute; left:100px; top:100px; width:100px; height:100px; background-color:red;"></div>
<div id="moveme1" style="position:absolute; left:0px; top:0px; width:50px; height:50px; background-color:green;"></div>
<div id="results1" style="position:absolute; left:10px; top:220px">...</div>

</td><td>getClientRects():

<div id="baseline2" style="position:absolute; left:300px; top:100px; width:100px; height:100px; background-color:red;"></div>
<div id="moveme2" style="position:absolute; left:0px; top:0px; width:50px; height:50px; background-color:green;"></div>
<div id="results2" style="position:absolute; left:220px; top:220px">...</div>

</td>
''';


void rectsShouldBeEqual(Rectangle baseline, Rectangle other) {
  Expect.approxEquals(baseline.left, other.left, null, "left");
  Expect.approxEquals(baseline.top, other.top, null, "top");
  Expect.approxEquals(baseline.right, other.right, null, "right");
  Expect.approxEquals(baseline.bottom, other.bottom, null, "bottom");
  Expect.approxEquals(baseline.left, other.left, null, "left");
}

void testGetClientBoundingRect() {
    Element baseline = document.getElementById("baseline1");
    Element moveme = document.getElementById("moveme1");

    Rectangle bounds = baseline.getBoundingClientRect();
    moveme.style.left = bounds.left.toString();
    moveme.style.top = bounds.top.toString();
    moveme.style.width = (bounds.right - bounds.left).toString();
    moveme.style.height = (bounds.bottom - bounds.top).toString();

    Rectangle newBounds = moveme.getBoundingClientRect();
    rectsShouldBeEqual(bounds, newBounds);
    document.getElementById("results1").append(new Element.html('<span style="color:green;"><b>PASS</b></span>'));
}

void testGetClientRects() {
    var baseline = document.getElementById("baseline2");
    var moveme = document.getElementById("moveme2");

    var boundsList = baseline.getClientRects();
    moveme.style.left = boundsList[0].left.toString();
    moveme.style.top = boundsList[0].top.toString();
    moveme.style.width = (boundsList[0].right - boundsList[0].left).toString();
    moveme.style.height = (boundsList[0].bottom - boundsList[0].top).toString();

    var newBoundList = moveme.getClientRects();
    rectsShouldBeEqual(boundsList[0], newBoundList[0]);
    document.getElementById("results2").append(new Element.html('<span style="color:green;"><b>PASS</b></span>'));
}
void runTest(e) {
    print("testGetClientBoundingRect:");
    testGetClientBoundingRect();
    print("testGetClientRects:");
    testGetClientRects();
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    document.body.style.zoom = "0.9";
    tc.addOnLoadListener((_) {
      runTest(_);
    });
}
