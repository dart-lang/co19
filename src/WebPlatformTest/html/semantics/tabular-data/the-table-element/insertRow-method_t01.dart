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

  var table = document.getElementById("test").queryAll("table")[0];
  assert_throws("IndexSizeError", () {
    table.insertRow(-2);
  });
  assert_throws("IndexSizeError", () {
    table.insertRow(2);
  });
}
