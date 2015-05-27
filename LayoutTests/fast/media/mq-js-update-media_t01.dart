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
    <style type="text/css" id="styleElement" media="all and (color)">
      div { background-color: red; }
    </style>
''';

const String htmlEL2 = r'''
    <span>This test verifies that when media query is updated, style is recalculated.</span>
    <div id="log"></div>
    <div id="divElement"\>
''';

void updateMediaQuery() {
    var styleElement = document.getElementById("styleElement");
    var divElement = document.getElementById("divElement");
    var divComputedStyle = divElement.getComputedStyle();

    //  Testing that background color is red. Media query "all and (color)".
    shouldBe(divComputedStyle.getPropertyValue('background-color'), "rgb(255, 0, 0)",
        "Div should have rgb(255, 0, 0) background color.");

    // update media attribute, background-color should not be red
    styleElement.setAttribute("media", "(monochrome) and (color)");

   //   Testing that updated media query doesn't match and background color is not red. Media query "(monochrome) and (color)".
    shouldBe(divComputedStyle.getPropertyValue('background-color'), "rgba(0, 0, 0, 0)",
        "New media query doesn't match, div should not have background color.");

     // reset media query to original
     styleElement.setAttribute("media", "all and (color)");
}

void updateMediaQuery2(e) {
    updateMediaQuery();
    checkTestFailures();
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen(updateMediaQuery2);
      // update media query while document is parsing
    updateMediaQuery();
}
