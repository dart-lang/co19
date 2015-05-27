/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description CSS3 media query test:
 * @media css rule media.mediaText property parsing, media query syntax error should be handled correctly. 
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<link rel="help" href="http://www.w3.org/TR/CSS21/media.html" />

<style type="text/css">
p#result {color: green}

@media not screen {
/* query will be modified from javascript */
/* the manipulation contains syntax error, and should fail */
p#result {color: red}
}

@media screen and resolution > 40dpi {
/* media query with syntax error should fail */
/* corresponding DOM manipulation will fail */
p#result {color: red}
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

    // The following is valid according to the CSS 2.1 note: "Media Queries
    // supercedes this error handling.", as it is malformed and should be
    // represented as "not all".
    List cssRules=document.styleSheets[document.styleSheets.length-1].cssRules;
    cssRules[1].media.mediaText = "screen and resolution > 40dpi";
    document.getElementById("result").innerHtml = "This text should be green.";
    String mediaText=cssRules[1].media.mediaText;
    document.getElementById("details").innerHtml = "New media: $mediaText";
    Expect.equals("not all", mediaText);
}
