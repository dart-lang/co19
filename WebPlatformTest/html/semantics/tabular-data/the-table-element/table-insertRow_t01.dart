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
 * after web-platform-tests/html/semantics/tabular-data/the-table-element/table-insertRow.html
 * @assertion
 * 
 * @description HTMLTableElement.insertRow 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
    
    test(() {
      var HTMLNS = "http://www.w3.org/1999/xhtml";
      var parentEl = document.createElementNS(HTMLNS, "html:table");
      assert_equals(parentEl.namespaceUri, HTMLNS, "Parent should be in the HTML namespace");
//      assert_equals(parentEl.prefix, "html", "Parent prefix should be html");
      assert_equals(parentEl.localName, "table", "Parent local name should be table");
      assert_equals(parentEl.tagName, "HTML:TABLE", "Parent tag name should be HTML:TABLE");
    
      var row = parentEl.insertRow(-1);
      assert_equals(row.namespaceUri, HTMLNS, "Row should be in the HTML namespace");
 //     assert_equals(row.prefix, null, "Row prefix should be null");
      assert_equals(row.localName, "tr", "Row local name should be tr");
      assert_equals(row.tagName, "TR", "Row tag name should be TR");
    
      var body = row.parentNode;
      assert_equals(body.namespaceUri, HTMLNS, "Body should be in the HTML namespace");
//      assert_equals(body.prefix, null, "Body prefix should be null");
      assert_equals(body.localName, "tbody", "Body local name should be tr");
      assert_equals(body.tagName, "TBODY", "Body tag name should be TR");
    
      assert_array_equals(parentEl.childNodes, [body]);
      assert_array_equals(body.childNodes, [row]);
      assert_array_equals(parentEl.rows, [row]);
    }, "insertRow should not copy prefixes");
    
    test(() {
      var table = document.createElement("table");
      var head = table.append(document.createElement("thead"));
      assert_array_equals(table.rows, []);
    
      var row = table.insertRow(-1);
      var body = row.parentNode;
      assert_array_equals(table.childNodes, [head, body]);
      assert_array_equals(head.childNodes, []);
      assert_array_equals(body.childNodes, [row]);
      assert_array_equals(table.rows, [row]);
    }, "insertRow should insert into a tbody, not into a thead, if table.rows is empty");
    
    test(() {
      var table = document.createElement("table");
      var foot = table.append(document.createElement("tfoot"));
      assert_array_equals(table.rows, []);
    
      var row = table.insertRow(-1);
      var body = row.parentNode;
      assert_array_equals(table.childNodes, [foot, body]);
      assert_array_equals(foot.childNodes, []);
      assert_array_equals(body.childNodes, [row]);
      assert_array_equals(table.rows, [row]);
    }, "insertRow should insert into a tbody, not into a tfoot, if table.rows is empty");
  
  checkTestFailures();
}
