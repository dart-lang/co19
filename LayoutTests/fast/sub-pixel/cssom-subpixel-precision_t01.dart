/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description client rect precision test
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL1 = r'''
    <style> 
        #test {
            width: 4.5px;
            height: 4.5px;
            background: navy;
        }
    </style>
''';

const String htmlEL2 = r'''
    <div id="test"></div>
    <div id="console">
        Box above should be 5x5px.<br>
    </div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var testElement = document.getElementById('test');
    var rect = testElement.getBoundingClientRect();
    var width = rect.right - rect.left;

    shouldBe(width, 4.5, 'width');
    shouldBe(testElement.clientWidth, 4.5, 'testElement.clientWidth');
    shouldBe(testElement.offsetWidth, 4.5, 'testElement.offsetWidth');

    var height = rect.bottom - rect.top;
    shouldBe(height, 4.5, 'height');
    shouldBe(testElement.clientHeight, 4.5, 'testElement.clientHeight');
    shouldBe(testElement.offsetHeight, 4.5, 'testElement.offsetHeight');

    checkTestFailures();
}
