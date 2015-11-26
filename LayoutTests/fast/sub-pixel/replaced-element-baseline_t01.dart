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
    <style type='text/css'>
        html, body {
            margin: 0;
            padding: 0;
        }
        input {  
            width: 100px;
            height: 2em;
            font-size: 12px;
            border: 1px solid black;
        }
        #b {   
            position: absolute;
            margin-left: 10px;
            left: 110px;
        }
    </style>
''';

const String htmlEL2 = r'''
    <input id="a"></input><input id="b"></input>
    <div id="console"></div>
''';

void main() {
    document.body.attributes['style']="margin: 0; padding: 0;";
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    shouldBe(document.getElementById('a').getBoundingClientRect().top, 0, 'id="a"');
    shouldBe(document.getElementById('b').getBoundingClientRect().top, 0, 'id="b"');

    checkTestFailures();
}
