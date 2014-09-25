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
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
<style>
#container {
    width: 1px;
}
#table {
    width: 200px;
    table-layout: fixed;
}
.wide-cell {
    width: 100px;
    padding: 0;
}
</style>
''';

const String htmlEL2 = r'''
    This test verifies table cell width is correctly updated after a table-layout change.
    <div id="container">
        <table id="table">
            <tr><td class="wide-cell" data-expected-width="100"></td><td class="wide-cell" data-expected-width="100"></td></tr>
        </table>
    </div>
    <div id="test-output"></div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);

    document.body.offsetTop;
    
    var table = document.getElementById("table");
    var row = table.insertRow(table.rows.length);
    row.insertCell(row.cells.length).setAttribute("data-expected-width", "100");
    row.insertCell(row.cells.length).setAttribute("data-expected-width", "100");
    
    document.body.offsetTop;
    
    var container = document.getElementById("container");
    container.style.setProperty("width", "500px");
    
    table.style.setProperty("table-layout", "auto");
    table.style.setProperty("width", "auto");
    
    checkLayout("#table tr td", document.getElementById("test-output"));
}