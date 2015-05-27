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
    td
    {
        width: 50px;
        height: 40px;
    }
    table.big td.binding
    {
        height: 80px;
    }

    table td.filler
    {
        height: auto;
    }
</style>
''';

const String htmlEL2 = r'''
<div style="height: 300px">
    <table border="1" style="height: 100%">
        <tr id="firstRow">
        <td class="binding"></td>
        <td></td>
        </tr>
        <tr>
        <td class="filler" ></td>
        <td class="filler" ></td>
        </tr>
    </table>
</div>
''';

var bigRows = false;

void toggleBigRows() {
    var table = document.querySelector("table");
    bigRows = !bigRows;
    if (bigRows)
        table.classes.add("big");
    else
        table.classes.remove("big");
}

void main() {
    description("Regression(99212): table rows get incorrect height after changing some cells' height<br>https://bugs.webkit.org/show_bug.cgi?id=74303");
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    Element firstRow = document.getElementById("firstRow");
    // Original value.
    shouldBe(firstRow.getComputedStyle('').getPropertyValue('height'), '44px');

    toggleBigRows();
    shouldBe(firstRow.getComputedStyle('').getPropertyValue('height'), '84px');
    toggleBigRows();
    shouldBe(firstRow.getComputedStyle('').getPropertyValue('height'), '44px');
    
    checkTestFailures();
}