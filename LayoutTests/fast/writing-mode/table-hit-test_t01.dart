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

const String htmlEL1 = r'''
<style>
    body { margin: 0; }
    caption div { width: 50px; height: 50px; }
    td { width: 50px; height: 25px; }
    #console { margin: 8px; }
</style>
''';

const String htmlEL2 = r'''
<table cellpadding="0" cellspacing="0" id="table">
    <tbody>
        <tr>
            <td id="1-1-1"></td>
            <td id="1-1-2"></td>
            <td id="1-1-3"></td>
        </tr>
        <tr>
            <td id="1-2-1"></td>
            <td id="1-2-2"></td>
            <td id="1-2-3"></td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td id="2-1-1"></td>
            <td id="2-1-2"></td>
            <td id="2-1-3"></td>
        </tr>
    </tbody>
    <caption id="c">
        <div></div>
    </caption>
</table>
''';

void checkElementAtPoint(x, y, id) {
    var actualID = document.elementFromPoint(x, y).id;
    test((){
        Expect.equals(id,  actualID);
    }, "$x, $y");
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var style = document.getElementById("table").style;

    checkElementAtPoint(1, 1, "c");
    checkElementAtPoint(1, 51, "1-1-1");
    checkElementAtPoint(51, 51, "1-1-2");
    checkElementAtPoint(101, 51, "1-1-3");
    checkElementAtPoint(1, 76, "1-2-1");
    checkElementAtPoint(51, 76, "1-2-2");
    checkElementAtPoint(101, 76, "1-2-3");
    checkElementAtPoint(1, 101, "2-1-1");
    checkElementAtPoint(51, 101, "2-1-2");
    checkElementAtPoint(101, 101, "2-1-3");

    print("\nTesting horizontal-bt:");
    style. writingMode = "horizontal-bt";
    checkElementAtPoint(1, 101, "c");
    checkElementAtPoint(1, 51, "1-1-1");
    checkElementAtPoint(51, 51, "1-1-2");
    checkElementAtPoint(101, 51, "1-1-3");
    checkElementAtPoint(1, 26, "1-2-1");
    checkElementAtPoint(51, 26, "1-2-2");
    checkElementAtPoint(101, 26, "1-2-3");
    checkElementAtPoint(1, 1, "2-1-1");
    checkElementAtPoint(51, 1, "2-1-2");
    checkElementAtPoint(101, 1, "2-1-3");

    print("\nTesting vertical-lr:");
    style. writingMode = "vertical-lr";
    checkElementAtPoint(1, 1, "c");
    checkElementAtPoint(51, 1, "1-1-1");
    checkElementAtPoint(51, 26, "1-1-2");
    checkElementAtPoint(51, 51, "1-1-3");
    checkElementAtPoint(101, 1, "1-2-1");
    checkElementAtPoint(101, 26, "1-2-2");
    checkElementAtPoint(101, 51, "1-2-3");
    checkElementAtPoint(151, 1, "2-1-1");
    checkElementAtPoint(151, 26, "2-1-2");
    checkElementAtPoint(151, 51, "2-1-3");

    print("\nTesting vertical-rl:");
    style. writingMode = "vertical-rl";
    checkElementAtPoint(151, 1, "c");
    checkElementAtPoint(101, 1, "1-1-1");
    checkElementAtPoint(101, 26, "1-1-2");
    checkElementAtPoint(101, 51, "1-1-3");
    checkElementAtPoint(51, 1, "1-2-1");
    checkElementAtPoint(51, 26, "1-2-2");
    checkElementAtPoint(51, 51, "1-2-3");
    checkElementAtPoint(1, 1, "2-1-1");
    checkElementAtPoint(1, 26, "2-1-2");
    checkElementAtPoint(1, 51, "2-1-3");

    checkTestFailures();
}