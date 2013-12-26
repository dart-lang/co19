/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Clearing the stack back to a table row context must be aborted
 * if the current node is template.
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

doTest([doc, templateInnerHTML, id, tagName, elementId]) {

  doc.body.setInnerHtml(
      '<table id="tbl">' +
      '<tr id="tr">' +
      '<template id="tmpl1">' +
      // When parser meets <th>, <td>, </tr>, stack must be cleared
      // back to table row context.
      // But <template> tag should abort this
      templateInnerHTML +
      '</template>' +
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

  Expect.equals(tr, template.parentNode,
      'Wrong template parent');
  
  if (id != null) {
    Expect.isNotNull(template.content.querySelector('#' + id),
        'Element should present in the template content');
  }
  if (tagName != null) {
    Expect.equals(tagName, template.content.querySelector('#' + id).tagName,
        'Wrong element in the template content');
  }
  if (elementId) {
    Expect.isNull(doc.querySelector('#' + elementId),
        'Table should have no element with ID ' + elementId);
  }
}

main() {
  var doc = newHtmlDocument();

  var parameters = [
    ['Clearing stack back to a table row context. Test <th>',
     doc, '<th id="th1">Table header</th>', 'th1', 'TH', 'th1'],

    ['Clearing stack back to a table row context. Test <td>',
     doc, '<td id="td1">Table cell</td>', 'td1', 'TD', 'td1'],

     ['Clearing stack back to a table row context. Test </tr>',
      doc, '</tr>', null, null]
  ];

  generate_tests(doTest, parameters,
      'Clearing stack back to a table body context.');
}