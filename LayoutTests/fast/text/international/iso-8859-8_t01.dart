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
import "../../../../Utils/expect.dart";
import "../../../testharness.dart";

const String htmlEL1 = r'''
<meta charset="ISO-8859-8">
''';

const String htmlEL2 = r'''
<p>Test rendering of ISO-8859-8.
<p>
<div class="test">���</div>
<div class="test">��� ��� </div>
<div class="test">��� abc ���</div>
<div class="test">abc ��� def</div>
<div class="test">��� <span dir=ltr>���</span></div>
<div class="test">��� <span dir=rtl>���</span></div>
''';

void checkClientRect(test, index, offset, dir, char) {
    Range range = document.createRange();
    if (test.nodeType == Node.TEXT_NODE ) {
        for (var i = 0; i < test.text.length; ++i) {
            String testname="$index/$dir/$i";
            var succeed = true;
            range.setStart(test, i);
            range.setEnd(test, i+1); 
            List<Rectangle> rects = range.getClientRects();
            if (dir == "ltr") {
                if (rects[0].left < offset) {
                    testFailed(testname, "character $range  should be rendered right of $char");
                    succeed = false;
                }
            } else {
                if (rects[0].left > offset) {
                    testFailed(testname, "character $range should be rendered left of $char");
                    succeed = false;
                }
            }
            offset = rects[0].left;
            char = range.toString();
            if (succeed == true) { 
                 testPassed(testname);
            }
        }

    } else if (test.nodeType == Node.ELEMENT_NODE) {
        for (Node node in test.childNodes) {
            checkClientRect(node, index, offset, dir, char);
        }
    }
} 

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
//    printPassed=true;
    var tests = document.getElementsByClassName('test');
    for (var i = 0; i < tests.length; ++i) {
        checkClientRect(tests[i], i, -1, "ltr", " ");

        tests[i].style.direction = "rtl";
        checkClientRect(tests[i], i, 10000, "rtl", " ");
    
        tests[i].style.display = "none";
    }
    checkTestFailures();
}
