/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * @assertion Clearing the stack back to a table context must be aborted if
 * the current node is template
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

doTest([doc, templateInnerHTML, id, tagName, bodiesNum, footerIsNull,
    headerIsNull]) {

  doc.body.setInnerHtml('' +
      '<table id="tbl">' +
      '<template id="tmpl1">' +
      // When parser meets <caption>, <colgroup>, <tbody>, <tfoot>, <thead>, <col>
      // stack must be cleared back to table context.
      //But <template> tag should abort this process
      templateInnerHTML +
      '</template>' +
      '<tr id="tr">' +
      '<td id="td">' +
      '</td>' +
      '</tr>' +
      '</table>',
      treeSanitizer: new NullTreeSanitizer());

  var table = doc.querySelector('#tbl');
  var tr = doc.querySelector('#tr');
  var td = doc.querySelector('#td');
  var template = doc.querySelector('#tmpl1');

  assert_equals(table.rows.length, 1, 'Wrong number of table rows');
  assert_equals(table.rows[0].cells.length, 1, 'Wrong number of table cells');
  assert_equals(template.parentNode, table, 'Wrong template parent');
  assert_not_equals(template.content.querySelector('#' + id), null,
      'Element should present in the template content');
  assert_equals(doc.querySelector('#tbl').caption, null, 'Table should have no caption');
  assert_equals(template.content.querySelector('#' + id).tagName, tagName,
      'Wrong element in the template content');
  if (bodiesNum) {
    assert_equals(table.tBodies.length, bodiesNum, 'Table should have '
        + bodiesNum + ' body');
  }
  if (footerIsNull) {
    assert_equals(table.tFoot, null, 'Table should have no footer');
  }
  if (headerIsNull) {
    assert_equals(table.tHead, null, 'Table should have no header');
  }
}

main () {
  var doc = newHTMLDocument();

  var parameters = [
    ['Clearing stack back to a table context. Test <caption>',
    doc, '<caption id="caption1">Table caption</caption>', 'caption1', 'CAPTION'],

    ['Clearing stack back to a table context. Test <colgroup>',
    doc, '<colgroup id="colgroup1" width="100%"/>', 'colgroup1', 'COLGROUP'],

    ['Clearing stack back to a table context. Test <tbody>',
    doc, '<tbody id="tbody1"></tbody>', 'tbody1', 'TBODY', 1],

    ['Clearing stack back to a table context. Test <tfoot>',
    doc, '<tfoot id="tfoot1"></tfoot>', 'tfoot1', 'TFOOT', null, true],

    ['Clearing stack back to a table context. Test <thead>',
    doc, '<thead id="thead1"></thead>', 'thead1', 'THEAD', null, false, true],

    ['Clearing stack back to a table context. Test <col>',
    doc, '<col id="col1" width="100%"/>', 'col1', 'COL']
  ];

  generate_tests(doTest, parameters, 'Clearing stack back to a table body context.');
}
