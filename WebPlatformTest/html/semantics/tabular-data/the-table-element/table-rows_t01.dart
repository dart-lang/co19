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
 * after web-platform-tests/html/semantics/tabular-data/the-table-element/table-rows.html
 * @assertion
 * 
 * @description HTMLTableElement.rows
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
    
    void test_table_simple(group, table) {
      var foo1 = group.append(document.createElement("tr"));
      foo1.id = "foo";
      var bar1 = group.append(document.createElement("tr"));
      bar1.id = "bar";
      var foo2 = group.append(document.createElement("tr"));
      foo2.id = "foo";
      var bar2 = group.append(document.createElement("tr"));
      bar2.id = "bar";
      assert_true(table.rows is List<TableRowElement>, "table.rows should be a List<TableRowElement>.");
      Expect.listEquals(table.rows, [foo1, bar1, foo2, bar2]);
    }
    
    test(() {
      var table = document.createElement("table");
      test_table_simple(table, table);
    }, "Children of table");
//    checkTestFailures();
//    return;

    test(() {
      var table = document.createElement("table");
      var group = table.append(document.createElement("thead"));
      test_table_simple(group, table);
    }, "Children of thead");
    
    test(() {
      var table = document.createElement("table");
      var group = table.append(document.createElement("tbody"));
      test_table_simple(group, table);
    }, "Children of tbody");
    
    test(() {
      var table = document.createElement("table");
      var group = table.append(document.createElement("tfoot"));
      test_table_simple(group, table);
    }, "Children of tfoot");
    
    test(() {
      Element table = document.createElement("table");
      Node orphan1 = table.append(document.createElement("tr"));
      (orphan1 as Element).id = "orphan1";
      Node foot1 = table.append(document.createElement("tfoot"));
      Node orphan2 = table.append(document.createElement("tr"));
      (orphan2 as Element).id = "orphan2";
      Node foot2 = table.append(document.createElement("tfoot"));
      Node orphan3 = table.append(document.createElement("tr"));
      (orphan3 as Element).id = "orphan3";
      Node body1 = table.append(document.createElement("tbody"));
      Node orphan4 = table.append(document.createElement("tr"));
      (orphan4 as Element).id = "orphan4";
      Node body2 = table.append(document.createElement("tbody"));
      Node orphan5 = table.append(document.createElement("tr"));
      (orphan5 as Element).id = "orphan5";
      Node head1 = table.append(document.createElement("thead"));
      Node orphan6 = table.append(document.createElement("tr"));
      (orphan6 as Element).id = "orphan6";
      Node head2 = table.append(document.createElement("thead"));
      Node orphan7 = table.append(document.createElement("tr"));
      (orphan7 as Element).id = "orphan7";

      Node foot1row1 = foot1.append(document.createElement("tr"));
      (foot1row1 as Element).id = "foot1row1";
      Node foot1row2 = foot1.append(document.createElement("tr"));
      (foot1row2 as Element).id = "foot1row2";
      Node foot2row1 = foot2.append(document.createElement("tr"));
      (foot2row1 as Element).id = "foot2row1";
      Node foot2row2 = foot2.append(document.createElement("tr"));
      (foot2row2 as Element).id = "foot2row2";

      Node body1row1 = body1.append(document.createElement("tr"));
      (body1row1 as Element).id = "body1row1";
      Node body1row2 = body1.append(document.createElement("tr"));
      (body1row2 as Element).id = "body1row2";
      Node body2row1 = body2.append(document.createElement("tr"));
      (body2row1 as Element).id = "body2row1";
      Node body2row2 = body2.append(document.createElement("tr"));
      (body2row2 as Element).id = "body2row2";

      Node head1row1 = head1.append(document.createElement("tr"));
      (head1row1 as Element).id = "head1row1";
      Node head1row2 = head1.append(document.createElement("tr"));
      (head1row2 as Element).id = "head1row2";
      Node head2row1 = head2.append(document.createElement("tr"));
      (head2row1 as Element).id = "head2row1";
      Node head2row2 = head2.append(document.createElement("tr"));
      (head2row2 as Element).id = "head2row2";
    
      // These elements should not end up in any collection.
      table.append(document.createElement("div"))
           .append(document.createElement("tr"));
      foot1.append(document.createElement("div"))
           .append(document.createElement("tr"));
      body1.append(document.createElement("div"))
           .append(document.createElement("tr"));
      head1.append(document.createElement("div"))
           .append(document.createElement("tr"));
      table.append(document.createElementNS("http://example.com/test", "tr"));
      foot1.append(document.createElementNS("http://example.com/test", "tr"));
      body1.append(document.createElementNS("http://example.com/test", "tr"));
      head1.append(document.createElementNS("http://example.com/test", "tr"));

      assert_true(table is TableElement, "table should be a TableElement, but is ${table.runtimeType}");
      assert_true((table as TableElement).rows is List<TableRowElement>, "table.rows should be a List<TableRowElement>, but is ${(table as TableElement).rows.runtimeType}");
      Expect.listEquals((table as TableElement).rows, [
        // thead
        head1row1,
        head1row2,
        head2row1,
        head2row2,
    
        // tbody + table
        orphan1,
        orphan2,
        orphan3,
        body1row1,
        body1row2,
        orphan4,
        body2row1,
        body2row2,
        orphan5,
        orphan6,
        orphan7,
    
        // tfoot
        foot1row1,
        foot1row2,
        foot2row1,
        foot2row2
      ]);
    
      List<String> ids = [
        "orphan1",
        "orphan2",
        "orphan3",
        "orphan4",
        "orphan5",
        "orphan6",
        "orphan7",
        "foot1row1",
        "foot1row2",
        "foot2row1",
        "foot2row2",
        "body1row1",
        "body1row2",
        "body2row1",
        "body2row2",
        "head1row1",
        "head1row2",
        "head2row1",
        "head2row2"
      ];

      Map<String,TableElement> rows = new Map.fromIterable((table as TableElement).rows,
                                                        key: (var te) => te.id,
                                                        value: (var te) => te);

      ids.forEach((String id) {
        assert_true(rows.containsKey(id), "contains($id) 1");
        assert_equals(rows[id].id, id);
      });
      while (table.firstChild!=null) {
        table.firstChild.remove();
      }
      rows = new Map.fromIterable((table as TableElement).rows,
                                key: (var te) => te.id,
                                value: (var te) => te);
      ids.forEach((id) {
        assert_false(rows.containsKey(id), "contains($id) 2");
        assert_equals(rows[id], null, "null");
      });
    }, "Complicated case");
  
    checkTestFailures();
}
