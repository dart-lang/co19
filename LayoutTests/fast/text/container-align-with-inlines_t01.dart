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
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
        <style>
            p {background:black; }
            div.reference {position: absolute; display: inline; background: blue; color: blue;}
            body {margin: 0px;}
        </style>
''';

const String htmlEL2 = r'''
    The blue box should be right-aligned. You will need to scroll right to see it.<br>
    https://bugs.webkit.org/show_bug.cgi?id=105695
    <div id='container' style="text-align: right">
        <p>XXX</p><div id="test" class="reference">XXX</div>
    </div>
    <div id="output">Failure</div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var testEl = document.getElementById('test'); 
    Expect.equals(testEl.offsetLeft, document.getElementById('container').offsetWidth);
    document.getElementById('output').text = 'Success'; 
}
