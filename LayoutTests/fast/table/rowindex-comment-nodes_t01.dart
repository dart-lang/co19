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
<p>This page tests whether or not comment nodes disrupt the row index of
rows in a table.</p>

<table><tr id="tr1"><td>Row One</tr><!-- COMMENT TO TRY TO MESS STUFF UP --><tr id="tr2"><td>Row Two</tr><!-- COMMENT TO TRY TO MESS STUFF UP --><tr id="tr3"><td>Row Three<!-- COMMENT TO TRY TO MESS STUFF UP --></table>

<hr>

<div id='console' style="background-color:white; border:2px solid black"></div>
''';

TableRowElement getTableRowElement(String id) {
    return document.getElementById(id) as TableRowElement;
}

void doTest(e) {
    shouldBe(document.getElementById('tr1').parentNode.childNodes.length, 5, 'tr1.length');
    shouldBe(getTableRowElement('tr1').rowIndex, 0, 'tr1.rowIndex');
    shouldBe(getTableRowElement('tr2').rowIndex, 1, 'tr2');
    (document.getElementById('tr2').parentNode as TableSectionElement).deleteRow(1);
    shouldBe(getTableRowElement('tr3').rowIndex, 1, 'tr3');

    checkTestFailures();
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    window.onLoad.listen(doTest);
}
