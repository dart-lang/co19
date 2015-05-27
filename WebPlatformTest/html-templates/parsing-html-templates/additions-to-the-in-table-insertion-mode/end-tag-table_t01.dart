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
 * @assertion If parser is in 'in table' insertion mode and end tag table is
 * met the ignore this token
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();

    doc.body.innerHtml = '<table id="table">'
    + '<template id="template">'
    + '</table>'
    + '</template>'
    + '<tr><td></td></tr>'
    + '</table>';

  var table = doc.querySelector('#table');
  var template = table.querySelector('#template');

  assert_equals(table.childNodes.length, 2, 'Wrong number of table children');
  assert_not_equals(template, null, 'Template element must be parsed');
  assert_equals(table.rows.length, 1, 'Wrong number of table rows');
  assert_equals(template.childNodes.length, 0, 'Wrong number of the template child nodes');
  assert_equals(template.content.childNodes.length, 0,
    'Wrong number of the template child nodes');


  }, 'In table insertion mode. Ignore </table> token');
}
