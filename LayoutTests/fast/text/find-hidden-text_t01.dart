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

bool canFind(String target, String specimen) {
    window.getSelection().empty();
    document.body.setInnerHtml(specimen, treeSanitizer: new NullTreeSanitizer());
    document.execCommand("FindString", false, target);
    bool result = window.getSelection().rangeCount != 0;
    window.getSelection().empty();
    return result;
}

void testTestStyle(isExpectedToFind, style, [outerStyle]) {
    var markup = "<div style='$style'>word</div>";
    var styleMessage = "styled with $style";
    StringBuffer sb = new StringBuffer();
    
    if (outerStyle != null) {
        markup = "<div style='$outerStyle'>$markup</div>";
        styleMessage = "$styleMessage inside an element styled with $outerStyle";
    }

    if (isExpectedToFind) {
        sb.write("testNonHiddenTextStyle");
    } else {
        sb.write("testHiddenTextStyle");
    }
    sb.write('("');
    sb.write(style);
    if (outerStyle != null) {
       sb.write('", "');
       sb.write(outerStyle);
    }
    sb.write('")');
    String testName=sb.toString();
    sb.clear();

    if (canFind("word", markup) == isExpectedToFind) {
        testPassed(testName);
        return;
    }

    if (isExpectedToFind) {
        sb.write("Could not find");
    } else {
        sb.write("Found");
    }
    sb.write(" a word ");
    sb.write(styleMessage);
    sb.write(".");
    testFailed(testName, sb.toString());
}

void testNonHiddenTextStyle(style, [outerStyle]) {
    testTestStyle(true, style, outerStyle);
}

void testHiddenTextStyle(style, [outerStyle]) {
    testTestStyle(false, style, outerStyle);
}

void runTests(e)  {
    testNonHiddenTextStyle("");

    testHiddenTextStyle("display:none");
    testHiddenTextStyle("visibility:hidden");

    testNonHiddenTextStyle("height:0");

    testHiddenTextStyle("height:0; overflow:hidden");
    testHiddenTextStyle("height:0; overflow:scroll");
    testHiddenTextStyle("height:0; overflow:auto");

    testHiddenTextStyle("width:0; overflow:hidden");
    testHiddenTextStyle("width:0; overflow:scroll");
    testHiddenTextStyle("width:0; overflow:auto");

    testHiddenTextStyle("height:0; overflow-x:hidden");
    testHiddenTextStyle("height:0; overflow-x:scroll");
    testHiddenTextStyle("height:0; overflow-x:auto");

    testHiddenTextStyle("width:0; overflow-x:hidden");
    testHiddenTextStyle("width:0; overflow-x:scroll");
    testHiddenTextStyle("width:0; overflow-x:auto");

    testHiddenTextStyle("height:0; overflow-y:hidden");
    testHiddenTextStyle("height:0; overflow-y:scroll");
    testHiddenTextStyle("height:0; overflow-y:auto");

    testHiddenTextStyle("width:0; overflow-y:hidden");
    testHiddenTextStyle("width:0; overflow-y:scroll");
    testHiddenTextStyle("width:0; overflow-y:auto");

    testHiddenTextStyle("position: relative", "height:0; overflow:hidden");
    testHiddenTextStyle("position: relative", "height:0; overflow:scroll");
    testHiddenTextStyle("position: relative", "height:0; overflow:auto");

    testNonHiddenTextStyle("position: absolute", "height:0; overflow:hidden");
    testNonHiddenTextStyle("position: absolute", "height:0; overflow:scroll");
    testNonHiddenTextStyle("position: absolute", "height:0; overflow:auto");

    testNonHiddenTextStyle("position: fixed", "height:0; overflow:hidden");
    testNonHiddenTextStyle("position: fixed", "height:0; overflow:scroll");
    testNonHiddenTextStyle("position: fixed", "height:0; overflow:auto");

    checkTestFailures();
}

void main() {
    window.onLoad.listen(runTests);
}
