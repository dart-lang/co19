/**
 * after web-platform-tests/html/semantics/tabular-data/the-tr-element/rowIndex.html
 * @assertion
 * 
 * @description HTMLTableRowElement.rowIndex
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
      var table = document.createElement("table");
      var row = document.createElement("tr");
      table.append(row);
      document.body.append(table);
print("row.rowIndex=${row.rowIndex}");

    test(() {
      var row = document.createElement("table")
                        .append(document.createElement("div"))
                        .append(document.createElement("tr"));
      assert_equals(row.rowIndex, -1);
    }, "div tr");
    
    test(() {
      var row = document.createElement("table")
                        .append(document.createElement("thead"))
                        .append(document.createElement("tr"));
      assert_equals(row.rowIndex, 0);
    }, "thead tr");
    
    test(() {
      var row = document.createElement("table")
                        .append(document.createElement("tbody"))
                        .append(document.createElement("tr"));
      assert_equals(row.rowIndex, 0);
    }, "tbody tr");
    
    test(() {
      var row = document.createElement("table")
                        .append(document.createElement("tfoot"))
                        .append(document.createElement("tr"));
      assert_equals(row.rowIndex, 0);
    }, "tfoot tr");
    
    test(() {
      var row = document.createElement("table")
                        .append(document.createElement("tr"));
      assert_equals(row.rowIndex, 0);
    }, "table tr");
    
    test(() {
      var row = document.createElementNS("", "table")
                        .append(document.createElement("thead"))
                        .append(document.createElement("tr"));
      assert_equals(row.rowIndex, -1);
    }, "NS thead tr");
    
    test(() {
      var row = document.createElementNS("", "table")
                        .append(document.createElement("tbody"))
                        .append(document.createElement("tr"));
      assert_equals(row.rowIndex, -1);
    }, "NS tbody tr");
    
    test(() {
      var row = document.createElementNS("", "table")
                        .append(document.createElement("tfoot"))
                        .append(document.createElement("tr"));
      assert_equals(row.rowIndex, -1);
    }, "NS tfoot tr");
    
    test(() {
      var row = document.createElementNS("", "table")
                        .append(document.createElement("tr"));
      assert_equals(row.rowIndex, -1);
    }, "NS tr");
    
    test(() {
      var row = document.createElement("table")
                        .append(document.createElementNS("", "thead"))
                        .append(document.createElement("tr"));
      assert_equals(row.rowIndex, -1);
    }, "NS.thead tr");
    
    test(() {
      var row = document.createElement("table")
                        .append(document.createElementNS("", "tbody"))
                        .append(document.createElement("tr"));
      assert_equals(row.rowIndex, -1);
    }, "NS.tbody tr");
    
    test(() {
      var row = document.createElement("table")
                        .append(document.createElementNS("", "tfoot"))
                        .append(document.createElement("tr"));
      assert_equals(row.rowIndex, -1);
    }, "NS.tfoot tr");
  
    checkTestFailures();
}
