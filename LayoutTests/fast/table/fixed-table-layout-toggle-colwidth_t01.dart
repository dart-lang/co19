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
        <style type="text/css">
            table
            {
                border-collapse: collapse;
                table-layout: fixed;
                width: 200px;
            }
            #cell
            {
                background: black;
            }
            #div1
            {
                background: blue;
                width: 100px;
            }
            #div1, #cell
            {
                height: 1em;
            }
        </style>
''';

const String htmlEL2 = r'''
        <table id="table">
            <colgroup id="colgroup">
                <col style="width: 50px">
                <col>
            </colgroup>
            <tr>
                <td id="cell"></td>
                <td></td>
           </tr>
        </table>
        <div id="div1"></div>
        <p id="console"></p>
''';

void toggleWidth(e) {
    var col = document.getElementById('colgroup').children[0];
    var oldCellWidth = document.getElementById('cell').getComputedStyle().width;
    col.style.width = "100px";
    var newCellWidth = document.getElementById('cell').getComputedStyle().width;

    Expect.notEquals(oldCellWidth, newCellWidth, "Cell did not change width");
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen(toggleWidth);

}
