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
 * after web-platform-tests/html/semantics/tabular-data/the-tr-element/rowIndex.html
 * @assertion
 * 
 * @description HTMLTableRowElement.rowIndex
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
      Node table = document.createElement("table");
      Node row = document.createElement("tr");
      table.append(row);
      document.body.append(table);
//      print("row.rowIndex=${row.rowIndex}");

    test(() {
      Node row = document.createElement("table")
                        .append(document.createElement("div"))
                        .append(document.createElement("tr"));
      assert_equals((row as TableRowElement).rowIndex, -1);
    }, "div tr");
    
    test(() {
      Node row = document.createElement("table")
                        .append(document.createElement("thead"))
                        .append(document.createElement("tr"));
      assert_equals((row as TableRowElement).rowIndex, 0);
    }, "thead tr");
    
    test(() {
      Node row = document.createElement("table")
                        .append(document.createElement("tbody"))
                        .append(document.createElement("tr"));
      assert_equals((row as TableRowElement).rowIndex, 0);
    }, "tbody tr");
    
    test(() {
      Node row = document.createElement("table")
                        .append(document.createElement("tfoot"))
                        .append(document.createElement("tr"));
      assert_equals((row as TableRowElement).rowIndex, 0);
    }, "tfoot tr");
    
    test(() {
      Node row = document.createElement("table")
                        .append(document.createElement("tr"));
      assert_equals((row as TableRowElement).rowIndex, 0);
    }, "table tr");
    
    test(() {
      Node row = document.createElementNS("", "table")
                        .append(document.createElement("thead"))
                        .append(document.createElement("tr"));
      assert_equals((row as TableRowElement).rowIndex, -1);
    }, "NS thead tr");
    
    test(() {
      Node row = document.createElementNS("", "table")
                        .append(document.createElement("tbody"))
                        .append(document.createElement("tr"));
      assert_equals((row as TableRowElement).rowIndex, -1);
    }, "NS tbody tr");
    
    test(() {
      Node row = document.createElementNS("", "table")
                        .append(document.createElement("tfoot"))
                        .append(document.createElement("tr"));
      assert_equals((row as TableRowElement).rowIndex, -1);
    }, "NS tfoot tr");
    
    test(() {
      Node row = document.createElementNS("", "table")
                        .append(document.createElement("tr"));
      assert_equals((row as TableRowElement).rowIndex, -1);
    }, "NS tr");
    
    test(() {
      Node row = document.createElement("table")
                        .append(document.createElementNS("", "thead"))
                        .append(document.createElement("tr"));
      assert_equals((row as TableRowElement).rowIndex, -1);
    }, "NS.thead tr");
    
    test(() {
      Node row = document.createElement("table")
                        .append(document.createElementNS("", "tbody"))
                        .append(document.createElement("tr"));
      assert_equals((row as TableRowElement).rowIndex, -1);
    }, "NS.tbody tr");
    
    test(() {
      Node row = document.createElement("table")
                        .append(document.createElementNS("", "tfoot"))
                        .append(document.createElement("tr"));
      assert_equals((row as TableRowElement).rowIndex, -1);
    }, "NS.tfoot tr");
  
    checkTestFailures();
}
