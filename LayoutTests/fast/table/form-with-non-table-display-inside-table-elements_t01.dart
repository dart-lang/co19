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
table {
    background:red;
    border-spacing:0;
    border-collapse:collapse;
    display:none
}

td {
    width:148px;
    background:green;
    height:18px;
}
form {
    width:50px;
    height:20px;
}
</style>
''';

const String htmlEL2 = r'''
<div id="testCases">
<div id="case1">
 <p> CASE 1 : Form element inside table.</p>
 <table>
  <form></form>
  <tr>
   <td></td>
  </tr>
 </table>
</div>
<div id="case2">
 <p> CASE 2 : Form element inside table section(tbody,thead or tfoot).</p>
 <table>
  <tbody>
   <form></form>
   <tr>
    <td></td>
   </tr>
  </tbody>
 </table>
</div>
<div id="case3">
 <p> CASE 3 : Form element inside table row.</p>
 <table>
  <tr>
    <form></form>
    <td></td>
  </tr>
 </table>
</div>
</div>
<div id="description"></div>
<div id="console"></div>
''';

void main() {
    description('''Testcase for bug <a href="http://webkit.org/b/86746">http://webkit.org/b/86746</a>. A form element whose immediate parent is either a table,
table section or a table row is considered as a demoted element. <br>Renderer for such an element is not created when its display is to a
non table type (Eg. BLOCK, INLINE, etc). However when a table containing form element is cloned, <br>the form element is not properly demoted.
This results in the creation of an unexpected renderer for the form element.''');
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    String diag='Expected: The tables should contain only one row of width 150px and one column of height 20px.';

    for(var i = 1; i <=3; i++) {
        Element container = document.getElementById('case$i');
        TableElement clonedTable = container.querySelector("TABLE").clone(true) as TableElement;
        clonedTable.style.display = 'table';
        container.append(clonedTable);
        shouldBe(clonedTable.getBoundingClientRect().width, 150, diag);
        shouldBe(clonedTable.getBoundingClientRect().height, 20, diag);
    }
}
