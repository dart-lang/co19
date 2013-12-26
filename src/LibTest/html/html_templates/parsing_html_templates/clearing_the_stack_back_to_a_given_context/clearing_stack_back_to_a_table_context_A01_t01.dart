/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Clearing the stack back to a table context must be aborted if
 * the current node is template.
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

doTest([doc, templateInnerHTML, id, tagName, bodiesNum, footerIsNull,
    headerIsNull]) {

  doc.body.setInnerHtml(
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
      treeSanitizer: new NoCheck());

  var table = doc.querySelector('#tbl');
  var tr = doc.querySelector('#tr');
  var td = doc.querySelector('#td');
  var template = doc.querySelector('#tmpl1');

  Expect.equals(1, table.rows.length,
      'Wrong number of table rows');

  Expect.equals(1, table.rows[0].cells.length,
      'Wrong number of table cells');

  Expect.equals(table, template.parentNode,
      'Wrong template parent');

  Expect.isNotNull(template.content.querySelector('#' + id),
      'Element should present in the template content');

  Expect.isNull(doc.querySelector('#tbl').caption,
      'Table should have no caption');

  Expect.equals(tagName, template.content.querySelector('#' + id).tagName,
      'Wrong element in the template content');

  if (bodiesNum) {
    Expect.equals(bodiesNum, table.tBodies.length,
        'Table should have $bodiesNum body');
  }
  if (footerIsNull) {
    Expect.isNull(table.tFoot,
        'Table should have no footer');
  }
  if (headerIsNull) {
    Expect.isNull(table.tHead,
        'Table should have no header');
  }
}

main() {
  var doc = newHtmlDocument();

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

  generate_tests(doTest, parameters,
      'Clearing stack back to a table body context.');
}