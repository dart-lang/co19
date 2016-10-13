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
 * after web-platform-tests/html/semantics/tabular-data/the-table-element/insertRow-method-01.html
 * @assertion
 * http://www.whatwg.org/html5/#dom-table-insertrow
 * @description insertRow(): INDEX_SIZE_ERR
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<div id="test">
<table>
<tr>
<td>
</table>
</div>
''';

void main() {
  document.body.appendHtml(htmlEL);

  Element table = document.getElementById("test").querySelector("table");
  assert_throws("IndexSizeError", () {
    (table as TableElement).insertRow(-2);
  });
  assert_throws("IndexSizeError", () {
    (table as TableElement).insertRow(2);
  });
}
