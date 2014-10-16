/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Bug 92497 https://bugs.webkit.org/show_bug.cgi?id=92497 
 * [CSS Regions] Region overset property is not properly computed when there is a region break 
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
        <style type="text/css">

            .columns {
                -webkit-column-count:2;
                width:250px;
            }

            .columns p:first-child {
                -webkit-column-break-after: always;
                margin-bottom: 10em; /*shouldn't spill over the forced break*/
            }

            .fail #pass, .pass #fail { display: none; }
        </style>
''';

const String htmlEL2 = r'''
        <div class="columns">
            <p>This is some text with bottom margin and forced break after.</p>
            <p>This paragraph should be aligned with the other paragraph because the 1st paragraph's bottom margin shouldn't spill over the forced break.</p>
        </div>
        <div id="pass">PASS</div>
        <div id="fail">FAIL</div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    document.body.className = "fail";
    Expect.equals(document.querySelector(".columns p:nth-child(2)").offsetTop, document.querySelector(".columns p:first-child").offsetTop);
    document.body.className = "pass";
}
