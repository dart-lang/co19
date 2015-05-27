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
        body {
            margin: 5px;
        }
        table {
            border-collapse: collapse;
        }
        td {
            background: skyblue;
            border: 1px solid black;
        }
        #measure {
            position: absolute;
            top: -500px;
            visibility: hidden;
        }
    </style>
''';

const String htmlEL2 = r'''
    <table id="main" cellspacing="0" border="0" cellpadding="0">
        <tr>
            <td>style.height</td>
            <td>rect.height</td>
            <td>rect.bottom - rect.top</td>
        </tr>
        <tr><td>a</td><td>b</td><td>c</td></tr>
        <tr><td>a</td><td>b</td><td>c</td></tr>
        <tr><td>a</td><td>b</td><td>c</td></tr>
        <tr><td>a</td><td>b</td><td>c</td></tr>
        <tr><td>a</td><td>b</td><td>c</td></tr>
        <tr><td>a</td><td>b</td><td>c</td></tr>
        <tr><td>a</td><td>b</td><td>c</td></tr>
        <tr><td>a</td><td>b</td><td>c</td></tr>
        <tr><td>a</td><td>b</td><td>c</td></tr>
    </table>
    <p>
        This tests whether table row heights are stable by measuring the
        height of a row, assigning that height to another row and then
        measuring it.
        For each row the numbers in the three cells should be the same.
    </p>
    <p>
        <a href="https://bugs.webkit.org/show_bug.cgi?id=88813">Bug 88813</a>
    </p>

    <table id="measure" cellspacing="0" border="0" cellpadding="0">
        <tr><td>Measurement</td><td>table</td><td>...</td></tr>
    </table>
''';

double r(n) {
    return (n * 1000).round() / 1000;
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    
    var mainTable = document.getElementById('main');
    var measureTable = document.getElementById('measure');
    var rowHeights = [];

    void computeHeights() {
        rowHeights.length = 0;
        var rowElement = measureTable.tBodies[0].rows[0];
        for (var i = 0; i < mainTable.tBodies[0].rows.length; i++) {
            // Set the size to a subpixel value, the exact value isn't
            // important but each row should have a different height.
            var height = r((20 + i) * 0.93 + i);
            rowElement.style.height = '${height}px';
            var rect = rowElement.getBoundingClientRect();
            rowHeights.add(rect.bottom - rect.top);
        }
    }
    
    void testHeights(zoom) {
        document.body.style.zoom = zoom.toString();
        computeHeights();
print("testHeights 1");    
        var rows = mainTable.tBodies[0].rows;
        for (var i = 0; i < rows.length; i++) {
            var rowElement = rows[i];
print("testHeights 2 $i");    
            rowElement.style.height = '${rowHeights[i]}px';
print("testHeights 3 $i");    
            var rect = rowElement.getBoundingClientRect();
            if (i>0) {
print("testHeights 4 $i");    
                rowElement.cells[0].firstChild.text = r(rowHeights[i]).toString();
                rowElement.cells[1].firstChild.text = r(rect.height).toString();
                rowElement.cells[2].firstChild.text = r(rect.bottom - rect.top).toString();
            }
        }

        for (var i = 0; i < rows.length; i++) {
            var rect = rows[i].getBoundingClientRect();
            shouldBe(r(rowHeights[i]), r(rect.height), 'rect.height at ${r(zoom * 100)}');
            shouldBe(r(rowHeights[i]), r(rect.bottom - rect.top), 'rect.bottom - rect.top at ${r(zoom * 100)}');
        }
    }
    
    testHeights(0.5);
    testHeights(0.75);
    testHeights(0.9);
    testHeights(1.1);
    testHeights(1.25);
    testHeights(1.33);
    testHeights(1.5);
    testHeights(1.75);
    testHeights(2);
    testHeights(1);

    checkTestFailures();
}
