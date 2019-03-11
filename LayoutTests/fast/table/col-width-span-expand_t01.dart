/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests <a href='http://webkit.org/b/14858'>Bug 14858: &lt;col&gt; width ignored when not tied to a single cell</a>. 
 */
import "dart:html";
import "../../testcommon.dart" as tc;
import "../../testharness.dart";

const String htmlEL1 = r'''
        <title>WebKit Bug 14858: col width ignored when not tied to a single cell</title>
        <link href="http://www.w3.org/TR/REC-CSS2/tables.html#q4" rel="help" />
        <style type="text/css">
div#testDiv {
    top: 10px;
    position: relative
}
div#info {
    position: relative
}
table {border-spacing: 0}
td {
    padding: 0;
}
        </style>
''';

const String htmlEL2 = r'''
This tests <a href='http://webkit.org/b/14858'>Bug 14858: &lt;col&gt; width ignored when not tied to a single cell</a>.
            <div id="info">
                Two rows of cells should look identical.<br>
            </div>
            <div id="testDiv">
            <table id="testTable">
                <col width="50" />
                <col width="100" />
                <col width="150" />
                <col width="200" />
                <tbody>
                    <tr>
                        <td style="background-color:red">left</td>
                        <td style="background-color:green" id="testCell" colspan="2">middle</td>
                        <td style="background-color:blue">right</td>
                    </tr>
                </tbody>
            </table>
            <table id="baseTable">
                <col width="50" />
                <col width="100" />
                <col width="150" />
                <col width="200" />
                <tbody>
                    <tr>
                        <td style="background-color:red">left</td>
                        <td style="background-color:green">middle</td>
                        <td style="background-color:green"></td>
                        <td style="background-color:blue">right</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="description"></div>
        <div id="console"></div>
''';

void runTest(e) {
    var testCell = document.getElementById('testCell');
    var testTable = document.getElementById('testTable');

    shouldBe(testCell.getComputedStyle().width, "250px");
    shouldBe(testTable.getComputedStyle().width, "500px");
    checkTestFailures();
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    tc.addOnLoadListener(runTest);
}
