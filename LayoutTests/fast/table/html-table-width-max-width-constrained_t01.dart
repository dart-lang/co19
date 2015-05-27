/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests that percent lengths of an absolutely positioned table is resolved
 * against the padding box of the parent.
 */
import "dart:html";
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
<style>
table {
    font: 20px/1 Ahem;
    border-collapse: separate;
    table-layout: fixed;
    max-width: 300px;
    width: 300px;
    border: 1px solid #dddddd;
    border-spacing: 0px;
}

td {
    padding: 0px;
    width: 200px;
    border-left: 1px solid #dddddd;
}
</style>
''';

const String htmlEL2 = r'''
<div>This test checks that a fixed table layout with max-width doesn't over-constraint
    the cell (ie the content width still wins over max-width per the specification).
</div>
<div>For this test to pass, the second cell shouldn't bleed out of the table.</div>
<table data-expected-width="404">
    <tbody>
        <tr>
        <td>Cell text</td>
        <td>Cell text text text text</td>
        </tr>
    </tbody>
</table>
''';

void runTest(e) {
    checkLayout('table');
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen(runTest);
}
