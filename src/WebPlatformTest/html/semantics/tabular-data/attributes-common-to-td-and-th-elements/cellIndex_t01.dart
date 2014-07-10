/**
 * after web-platform-tests/html/semantics/tabular-data/attributes-common-to-td-and-th-elements/cellIndex.html * @assertion
 * @assertion
 * 
 * @description HTMLTableCellElement.cellIndex
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
  
  test(() {
    var th = document.createElement("th");
    assert_equals(th.cellIndex, -1);
    var td = document.createElement("td");
    assert_equals(td.cellIndex, -1);
  }, "For cells without a parent, cellIndex should be -1.");
  
  test(() {
    var table = document.createElement("table");
    var th = table.append(document.createElement("th"));
    assert_equals(th.cellIndex, -1);
    var td = table.append(document.createElement("td"));
    assert_equals(td.cellIndex, -1);
  }, "For cells whose parent is not a tr, cellIndex should be -1.");
  
  test(() {
    var tr = document.createElementNS("", "tr");
    var th = tr.append(document.createElement("th"));
    assert_equals(th.cellIndex, -1);
    var td = tr.append(document.createElement("td"));
    assert_equals(td.cellIndex, -1);
  }, "For cells whose parent is not a HTML tr, cellIndex should be -1.");
  
  test(() {
    var tr = document.createElement("tr");
    var th = tr.append(document.createElement("th"));
    assert_equals(th.cellIndex, 0);
    var td = tr.append(document.createElement("td"));
    assert_equals(td.cellIndex, 1);
  }, "For cells whose parent is a tr, cellIndex should be the index.");
  
  checkTestFailures();
}
