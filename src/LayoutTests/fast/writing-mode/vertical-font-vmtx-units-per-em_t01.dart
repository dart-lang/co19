/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Vertical text using font with vmtx table and units per em
 */
import "dart:html";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

const String htmlEL1 = r'''
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
@font-face {
    font-family: 'droid';
    /* DroidSansFallback-reduced.ttf was generated based on Android's
       DroidSansFallback.ttf by removing many glyphs to meet the size
       requirement of web font face.
       It contains a vmtx table and units per pm 256 which is different
       from the default value 1000. */
    src: url('resources/DroidSansFallback-reduced.ttf');
}
#test {
    font-size: 25px;
    font-family: droid;
    -webkit-writing-mode: vertical-rl;
}
</style>
''';

const String htmlEL2 = r'''
The characters in the vertical div should not overlap.
<div id="result"></div>
<div id="test">
&#x4e00;&#x4e01;&#x4e02;&#x4e03;&#x4e04;&#x4e05;&#x4e06;
</div>
''';

void doTest() {
    var height = document.getElementById("test").offsetHeight;
    // If the units per em in the font is not respected, the height of the
    // test div will be much smaller than 25*7.
    Expect.equals(25*7, height);
}

void main() {
    document.head.appendHtml(htmlEL1);
//    document.body.appendHtml(htmlEL2);
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    window.onLoad.listen((e) {
        document.body.offsetTop;
        runLater(doTest, 100);
    });
}