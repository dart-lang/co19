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

const String htmlEL2 = r'''
    <p>There should be no red below. <br> 
    The bordercolor attribute on a cell or row should have no effect. <br>
    https://bugs.webkit.org/show_bug.cgi?id=101677</p> 

    <table id="table" border="0" width="100%" height="100%">
        <tr>
            <td id="cell" bordercolor="red" height="26"></td>
        </tr>
    </table>

    <table id="table2" border="" width="100%" height="100%">
        <tr>
            <td id="cell2" bordercolor="red" height="26"></td>
        </tr>
    </table>

    <table id="table3" border="2" width="100%" height="100%">
        <tr>
            <td id="cell3" bordercolor="red" height="26"></td>
        </tr>
    </table>

    <table id="table4" border="2" width="100%" height="100%">
        <tr id="row4" bordercolor="red">
            <td height="26"></td>
        </tr>
    </table>

    <table id="table5" border="2" width="100%" height="100%">
        <tbody>
        <col id="col5" bordercolor="red">
        <tr>
            <td height="26"></td>
        </tr>
        </tbody>
    </table>

    <table id="table6" border="2" width="100%" height="100%">
        <tbody id="tbody6" bordercolor="red">
        <tr>
            <td height="26"></td>
        </tr>
        </tbody>
    </table>

    <table id="table7" border="2" width="100%" height="100%">
        <tbody>
        <colgroup id="col7" bordercolor="red">
            <col>
        </colgroup>
        <tr>
            <td height="26"></td>
        </tr>
        </tbody>
    </table>

    <div id="console"></div>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var cell = document.getElementById("cell");
    shouldBe(cell.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(0, 0, 0)");
    shouldBe(cell.getComputedStyle(null).getPropertyValue("border-top-width"), "0px");
    var table = document.getElementById("table");
    shouldBe(table.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(128, 128, 128)");
    shouldBe(table.getComputedStyle(null).getPropertyValue("border-top-width"), "0px");

    var cell2 = document.getElementById("cell2");
    shouldBe(cell2.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(128, 128, 128)");
    shouldBe(cell2.getComputedStyle(null).getPropertyValue("border-top-width"), "1px");
    var table2 = document.getElementById("table2");
    shouldBe(table2.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(128, 128, 128)");
    shouldBe(table2.getComputedStyle(null).getPropertyValue("border-top-width"), "1px");

    var cell3 = document.getElementById("cell3");
    shouldBe(cell3.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(128, 128, 128)");
    shouldBe(cell3.getComputedStyle(null).getPropertyValue("border-top-width"), "1px");
    var table3 = document.getElementById("table3");
    shouldBe(table3.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(128, 128, 128)");
    shouldBe(table3.getComputedStyle(null).getPropertyValue("border-top-width"), "2px");

    var row4 = document.getElementById("row4");
    shouldBe(row4.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(128, 128, 128)");
    shouldBe(row4.getComputedStyle(null).getPropertyValue("border-top-width"), "0px");
    var table4 = document.getElementById("table4");
    shouldBe(table4.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(128, 128, 128)");
    shouldBe(table4.getComputedStyle(null).getPropertyValue("border-top-width"), "2px");

    var col5 = document.getElementById("col5");
    shouldBe(col5.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(0, 0, 0)");
    shouldBe(col5.getComputedStyle(null).getPropertyValue("border-top-width"), "0px");
    var table5 = document.getElementById("table5");
    shouldBe(table5.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(128, 128, 128)");
    shouldBe(table5.getComputedStyle(null).getPropertyValue("border-top-width"), "2px");

    var tbody6 = document.getElementById("tbody6");
    shouldBe(tbody6.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(128, 128, 128)");
    shouldBe(tbody6.getComputedStyle(null).getPropertyValue("border-top-width"), "0px");
    var table6 = document.getElementById("table6");
    shouldBe(table6.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(128, 128, 128)");
    shouldBe(table6.getComputedStyle(null).getPropertyValue("border-top-width"), "2px");

    var col7 = document.getElementById("col7");
    shouldBe(col7.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(0, 0, 0)");
    shouldBe(col7.getComputedStyle(null).getPropertyValue("border-top-width"), "0px");
    var table7 = document.getElementById("table7");
    shouldBe(table7.getComputedStyle(null).getPropertyValue("border-top-color"), "rgb(128, 128, 128)");
    shouldBe(table7.getComputedStyle(null).getPropertyValue("border-top-width"), "2px");

    checkTestFailures();
}
