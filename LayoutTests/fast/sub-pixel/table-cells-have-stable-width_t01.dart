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
    <style>
        #firstCell {
            border-right: 3px solid #e5ecf9;
            width: 12em;
            padding: 0.5em .5em .5em 0;
            font-size: 95%;
        }
        #content {
            position: relative;
        }
        #fixedTable {
            table-layout: fixed;
        }
        #firstFixedCell {
            width: 21.2px;
            margin: 0.3px;
            padding: 0.1px;
        }
    </style>
''';

const String htmlEL2 = r'''
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tbody class="collapse"> 
            <tr>
                <td id="firstCell">
                    <div id="content">
                        <table cellspacing="0" cellpadding="0">
                            <tbody>
                                <tr>
                                    <th align="left">Cc:</th>
                                    <td>AutoTableLayout</td>
                                </tr>
                        </tbody>
                    </table>
                </div>
            </td>
            <td width="100%"></td>
            </tr>
        </tbody>
    </table>
    
    <table id="fixedTable">
        <tr>
            <td id="firstFixedCell"><div id="fixedContent">foo</div></td>
            <td>FixedTableLayout</td>
        </tr>
    </table>
    
    <p>
        Tests that setting the width of an element inside a cell to the computed width of said element does not change the width of the cell itself.
    </p>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var autoEl = document.getElementById("content");
    var autoCell = document.getElementById("firstCell");
    var autoExpectedWidth = autoCell.getBoundingClientRect().width;
    autoEl.style.width = "${autoEl.getBoundingClientRect().width}px";
    shouldBe(autoCell.getBoundingClientRect().width, autoExpectedWidth, 'Cell in AutoTable');

    var fixedEl = document.getElementById("fixedContent");
    var fixedCell = document.getElementById("firstFixedCell");
    var fixedExpectedWidth = fixedCell.getBoundingClientRect().width;
    fixedEl.style.width = "${fixedEl.getBoundingClientRect().width}px";
    shouldBe(fixedCell.getBoundingClientRect().width, fixedExpectedWidth, 'Cell in FixedTable');

    checkTestFailures();
}
