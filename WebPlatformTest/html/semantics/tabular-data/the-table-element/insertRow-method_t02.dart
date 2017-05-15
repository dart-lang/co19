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
 * after web-platform-tests/html/semantics/tabular-data/the-table-element/insertRow-method-02.html
 * @assertion
 * http://www.whatwg.org/html5/#dom-table-insertrow
 * @description insertRow(): Empty table
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<div id="test">
<table></table>
</div>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
 
  var HTML = "http://www.w3.org/1999/xhtml";

  var table = document.getElementById("test").queryAll("table")[0];
  test(() {
    assert_equals(table.childNodes.length, 0);
    assert_equals(table.rows.length, 0);
  }, "table should start out empty");

  var tr;
  test(() {
    tr = table.insertRow(0);
    assert_equals(tr.localName, "tr");
    assert_equals(tr.namespaceUri, HTML);
  }, "insertRow should insert a tr element");

  var tbody = tr.parentNode;
  test(() {
    assert_equals(tbody.localName, "tbody");
    assert_equals(tbody.namespaceUri, HTML);
    assert_equals(tbody.parentNode, table);
  }, "insertRow should insert a tbody element");
  
    checkTestFailures();
}
