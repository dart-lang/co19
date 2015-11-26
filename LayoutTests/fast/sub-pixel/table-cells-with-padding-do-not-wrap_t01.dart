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
        #cell {
            font: menu;
            background-color: skyblue;
            padding-left: .73em;
            white-space: nowrap;
        }
        #display-cell {
            font: menu;
            background-color: green;
            display: table-cell;
            padding-left: .73em;
            white-space: nowrap;
        }
    </style>
''';

const String htmlEL2 = r'''
    <table>
        <tr>
            <td id="cell">Should not wrap</td>
        </tr>
    </table>
    <div id="display-cell">Should not wrap</div>
''';

num getElementHeight(element) {
    var rect = element.getBoundingClientRect();;
    return rect.bottom - rect.top;
}

void testHeight(id, description)  {
    var cellElement = document.getElementById(id);
    var expectedHeight = getElementHeight(cellElement);
    cellElement.style.whiteSpace = 'normal';
    if (getElementHeight(cellElement) == expectedHeight)
        testPassed(description);
    else
        testFailed(description, 'wraps');
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    testHeight('cell', 'table cell');
    testHeight('display-cell', 'display: table-cell');

    checkTestFailures();
}
