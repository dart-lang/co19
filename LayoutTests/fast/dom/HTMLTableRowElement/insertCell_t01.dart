/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests a particular case of insertCell that was crashing 
 * on ebay at the time the test was written.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p><table><tr id="row"></tr></table></p>
    ''', treeSanitizer: new NullTreeSanitizer());

  TableRowElement tr = document.getElementById('row');
    tr.insertCell(0).innerHtml = "<td>cell inside table inside cell 0</td>";
    tr.insertCell(1).innerHtml = "<td>cell inside table inside cell 1</td>";

    List cells = tr.queryAll('td');
    shouldBe(cells.length, 2);
}
