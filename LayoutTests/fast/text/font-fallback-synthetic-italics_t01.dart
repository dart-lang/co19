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
        <meta charset="utf-8">
        <script src="../../resources/js-test.js"></script>
        <style>
            #test, #reference {
                font-style: italic;
                font-size: 32px;
            }
            #test {
                font-family: arial, serif;
            }
            #reference {
                font-family: serif;
            }
        </style>
''';

const String htmlEL2 = r'''
        <p>
            The following lines should <b>not</b> be rendered with the same
            font.
        </p>
        <span id="test">اختبار النص مائل</span><br>
        <span id="reference">اختبار النص مائل</span><br>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);

    var testRect = document.getElementById('test').getBoundingClientRect();
    var referenceRect = document.getElementById('reference').getBoundingClientRect();
    
    var matches = testRect.left == referenceRect.left &&
        testRect.right == referenceRect.right &&
        testRect.height == referenceRect.height;

    Expect.isFalse(matches, 'The two lines should not match.');
}
