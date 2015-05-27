/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description CSS3 media query test: @media css rule media.mediaText property parsing,
 * media query syntax error should be handled correctly (,,,,).
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL1 = r'''
<link rel="help" href="http://www.w3.org/TR/CSS21/media.html">
<link rel="help" href="http://www.w3.org/TR/DOM-Level-2-Style/css.html#CSS-CSSMediaRule">

<!-- this test shows there there is no disconnect between CSS media queries and HTML5 media descriptors -->
<style type="text/css">

p#result { color: red }

@media braille {
    /* query will be modified from javascript */
    /* the manipulation contains syntax error, and should fail */
    p#result { color: red }
}

</style>
''';

const String htmlEL2 = r'''
<p id="result">Failure: test not run</p>
<p id="details"></p>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    var styleSheet=document.styleSheets[document.styleSheets.length-1];
    var result=document.getElementById("result");

    // This shouldn't throw.
    styleSheet.media.mediaText = ",,,,";
    result.innerHtml = "Success. This text should not be red.";

    // This shouldn't throw.
    styleSheet.cssRules[1].media.mediaText = ",,,,";
    result.innerHtml = "Success. This text should not be red.";
}
