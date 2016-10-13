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
 * after web-platform-tests/html/semantics/tabular-data/the-table-element/createTBody.html
 * @assertion
 * 
 * @description HTMLTableElement.createTBody
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
    String htmlNS = "http://www.w3.org/1999/xhtml";
    
    void assert_tbody(Element tbody) {
      assert_equals(tbody.localName, "tbody");
      assert_equals(tbody.namespaceUri, htmlNS);
//      assert_equals(tbody.prefix, null);
    }
    
    test(() {
      Element table = document.createElement("table");
      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_equals(table.firstChild, tbody);
      assert_tbody(tbody);
    }, "No child nodes");
    
    test(() {
      Element table = document.createElement("table");
      Node before = table.append(document.createElement("tbody"));
      assert_array_equals(table.childNodes, [before]);

      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_array_equals(table.childNodes, [before, tbody]);
      assert_tbody(tbody);
    }, "One tbody child node");
    
    test(() {
      Element table = document.createElement("table");
      Node before1 = table.append(document.createElement("tbody"));
      Node before2 = table.append(document.createElement("tbody"));
      assert_array_equals(table.childNodes, [before1, before2]);

      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_array_equals(table.childNodes, [before1, before2, tbody]);
      assert_tbody(tbody);
    }, "Two tbody child nodes");
    
    test(() {
      Element table = document.createElement("table");
      Node before1 = table.append(document.createElement("thead"));
      Node before2 = table.append(document.createElement("tbody"));
      assert_array_equals(table.childNodes, [before1, before2]);

      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_array_equals(table.childNodes, [before1, before2, tbody]);
      assert_tbody(tbody);
    }, "A thead and a tbody child node");
    
    test(() {
      Element table = document.createElement("table");
      Node before1 = table.append(document.createElement("tfoot"));
      Node before2 = table.append(document.createElement("tbody"));
      assert_array_equals(table.childNodes, [before1, before2]);

      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_array_equals(table.childNodes, [before1, before2, tbody]);
      assert_tbody(tbody);
    }, "A tfoot and a tbody child node");
    
    test(() {
      Element table = document.createElement("table");
      Node before = table.append(document.createElement("tbody"));
      Node after = table.append(document.createElement("thead"));
      assert_array_equals(table.childNodes, [before, after]);
    
      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_array_equals(table.childNodes, [before, tbody, after]);
      assert_tbody(tbody);
    }, "A tbody and a thead child node");
    
    test(() {
      Element table = document.createElement("table");
      Node before = table.append(document.createElement("tbody"));
      Node after = table.append(document.createElement("tfoot"));
      assert_array_equals(table.childNodes, [before, after]);
    
      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_array_equals(table.childNodes, [before, tbody, after]);
      assert_tbody(tbody);
    }, "A tbody and a tfoot child node");
    
    test(() {
      Element table = document.createElement("table");
      Node before1 = table.append(document.createElement("tbody"));
      Node before2 = table.append(document.createElement("tbody"));
      Node after = table.append(document.createElement("div"));
      assert_array_equals(table.childNodes, [before1, before2, after]);
    
      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_array_equals(table.childNodes, [before1, before2, tbody, after]);
      assert_tbody(tbody);
    }, "Two tbody child nodes and a div");
    
    test(() {
      Element table = document.createElement("table");
      Node before = table.append(document.createElement("tbody"));
      Node after = table.append(document.createElementNS("x", "tbody"));
      assert_array_equals(table.childNodes, [before, after]);
    
      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_array_equals(table.childNodes, [before, tbody, after]);
      assert_tbody(tbody);
    }, "One HTML and one namespaced tbody child node");
    
    test(() {
      Element table = document.createElement("table");
      Node before1 = table.append(document.createElement("tbody"));
      Node before2 = before1.append(document.createElement("tbody"));
      assert_array_equals(table.childNodes, [before1]);
    
      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_array_equals(table.childNodes, [before1, tbody]);
      assert_tbody(tbody);
    }, "Two nested tbody child nodes");
    
    test(() {
      Element table = document.createElement("table");
      Node before1 = table.append(document.createElement("thead"));
      Node before2 = before1.append(document.createElement("tbody"));
      assert_array_equals(table.childNodes, [before1]);
    
      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_array_equals(table.childNodes, [before1, tbody]);
      assert_tbody(tbody);
    }, "A tbody node inside a thead child node");
    
    test(() {
      Element table = document.createElement("table");
      Node before1 = table.append(document.createElement("tfoot"));
      Node before2 = before1.append(document.createElement("tbody"));
      assert_array_equals(table.childNodes, [before1]);
    
      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_array_equals(table.childNodes, [before1, tbody]);
      assert_tbody(tbody);
    }, "A tbody node inside a tfoot child node");
    
    test(() {
      Element table = document.createElement("table");
      Node before = table.append(document.createElement("tbody"));
      Node after1 = table.append(document.createElement("thead"));
      Node after2 = after1.append(document.createElement("tbody"));
      assert_array_equals(table.childNodes, [before, after1]);
    
      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_array_equals(table.childNodes, [before, tbody, after1]);
      assert_tbody(tbody);
    }, "A tbody node inside a thead child node after a tbody child node");
    
    test(() {
      Element table = document.createElement("table");
      Node before = table.append(document.createElement("tbody"));
      Node after1 = table.append(document.createElement("tfoot"));
      Node after2 = after1.append(document.createElement("tbody"));
      assert_array_equals(table.childNodes, [before, after1]);
    
      TableSectionElement tbody = (table as TableElement).createTBody();
      assert_array_equals(table.childNodes, [before, tbody, after1]);
      assert_tbody(tbody);
    }, "A tbody node inside a tfoot child node after a tbody child node");
  
    checkTestFailures();
}
