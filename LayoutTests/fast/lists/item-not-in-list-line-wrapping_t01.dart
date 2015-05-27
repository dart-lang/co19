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
import "../../testharness.dart";

const String htmlEL2 = r'''
    <p>
        Test for <i><a href="http://bugs.webkit.org/show_bug.cgi?id=12746">http://bugs.webkit.org/show_bug.cgi?id=12746</a>
        REGRESSION (r13853): List item's first line overflows containing div</i>.
    </p>
    <p>
        Text should not overflow the yellow box.
    </p>
    <div style="background-color:yellow; width: 125px;">
        <li><span id="text">
            Lorem ipsum dolor sit amet
        </span></li>
    </div>
    <div id="result">
    </div>
''';

void main() {
    document.body.appendHtml(htmlEL2);

    var result = document.getElementById("result");
    var text = document.getElementById("text");
    Expect.isTrue(text.offsetWidth <= 125,  "text.offsetWidth=${text.offsetWidth}");
    result.innerHtml = "PASS";
}