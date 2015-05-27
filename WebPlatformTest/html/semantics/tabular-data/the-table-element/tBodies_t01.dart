/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
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
 * after web-platform-tests/html/semantics/tabular-data/the-table-element/tBodies.html
 * @assertion
 * 
 * @description HTMLTableElement.tBodies 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
  var text =
    '<html xmlns="http://www.w3.org/1999/xhtml">' +
    '  <head>' +
    '    <title>Virtual Library</title>' +
    '  </head>' +
    '  <body>' +
    '    <table id="mytable" border="1">' +
    '      <tbody>' +
    '        <tr><td>Cell 1</td><td>Cell 2</td></tr>' +
    '        <tr><td>Cell 3</td><td>Cell 4</td></tr>' +
    '      </tbody>' +
    '    </table>' +
    '  </body>' +
    '</html>';

  var parser = new DomParser();
  var doc = parser.parseFromString(text, "text/xml");

  // import <table>
  var table = doc.documentElement.queryAll('table')[0];
  var mytable = document.body.append(document.importNode(table, true));

  assert_equals(mytable.tBodies.length, 1);
  var tbody = document.createElement('tbody');
  mytable.append(tbody);
  var tr = tbody.insertRow(-1);
  tr.insertCell(-1).append(new Text('Cell 5'));
  tr.insertCell(-1).append(new Text('Cell 6'));
  assert_equals(mytable.tBodies.length, 2);
  assert_equals(mytable.rows.length, 3);
  assert_equals(tr.rowIndex, 2);
}
