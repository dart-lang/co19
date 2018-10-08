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
 * @assertion Clearing the stack back to a table row context must be aborted
 * if the current node is template
 */

import '../../testcommon.dart';

doTest([doc, templateInnerHTML, id, tagName, elementId]) {

  doc.body.setInnerHtml('' +
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
      treeSanitizer: new NullTreeSanitizer());

  var table = doc.querySelector('#tbl');
  var tr = doc.querySelector('#tr');
  var td = doc.querySelector('#td');
  var template = doc.querySelector('#tmpl1');

  assert_equals(table.rows.length, 1, 'Wrong number of table rows');
  assert_equals(table.rows[0].cells.length, 1, 'Wrong number of table cells');
  assert_equals(template.parentNode, tr, 'Wrong template parent');
  if (id != null) {
    assert_not_equals(template.content.querySelector('#' + id), null,
        'Element should present in the template content');
  }
  if (tagName != null) {
    assert_equals(template.content.querySelector('#' + id).tagName, tagName,
        'Wrong element in the template content');
  }
  if (elementId) {
    assert_equals(doc.querySelector('#' + elementId), null,
        'Table should have no element with ID ' + elementId);
  }
}

main() {
  var doc = newHTMLDocument();

  var parameters = [
    ['Clearing stack back to a table row context. Test <th>',
    doc, '<th id="th1">Table header</th>', 'th1', 'TH', 'th1'],

    ['Clearing stack back to a table row context. Test <td>',
    doc, '<td id="td1">Table cell</td>', 'td1', 'TD', 'td1'],

    ['Clearing stack back to a table row context. Test </tr>',
    doc, '</tr>', null, null]
  ];

  generate_tests(doTest, parameters, 'Clearing stack back to a table body context.');
}
