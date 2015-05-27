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
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
    <style type="text/css">
        @media screen {
            #console { color: black; }
        }
    </style>
''';

const String htmlEL2 = r'''
    <div id="console"></div>
''';

bool failed = false;

String resultStringifier(result) {
    if (result == "")
        return '<b>""</b>';
    else if (result == null)
        return "<b>null</b>";
    return '"$result"';
}

void printOut(expect, res) {
    var console = document.getElementById("console");
    var span = document.createElement('span');

    var a =  resultStringifier(expect);
    var b = resultStringifier(res);
    
    if (a == b) {
        span.innerHtml += "PASS: Got $b as expected.<br>";
    } else {
        span.innerHtml += "FAIL: Got $b but was expecting $a<br>";
        failed=true;
    }
    console.append(span);
}

void runTests(e) {
    var rules = document.styleSheets[document.styleSheets.length-1].cssRules;
    var mediaList = rules.item(0).media;

    printOut("screen", mediaList.mediaText);

    mediaList.mediaText = null;
    printOut("", mediaList.mediaText);

    mediaList.mediaText = "screen";
    mediaList.mediaText = ",,all,,";
    printOut("not all, not all, all, not all, not all", mediaList.mediaText);

    mediaList.mediaText = ",,all,, ";
    printOut("not all, not all, all, not all, not all", mediaList.mediaText);

    var output = "all";
    try {
        mediaList.mediaText = ",screen,,&invalid,,";
    } catch(e) {
        output = null;
    }
    printOut("not all, screen, not all, not all, not all, not all", mediaList.mediaText);

    output = "all";
    try {
        mediaList.mediaText = ",screen,,(invalid,),,";
    } catch(e) {
        output = null;
    }
    printOut("not all, screen, not all, not all, not all, not all", mediaList.mediaText);

    output = "all";
    try {
        mediaList.mediaText = ",(all,),,";
    } catch(e) {
        output = null;
    }
    printOut("not all, not all, not all, not all", mediaList.mediaText);
    Expect.isFalse(failed);
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen(runTests);
}
