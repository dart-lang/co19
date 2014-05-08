/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.title-06.html
 * @assertion http://www.whatwg.org/html5/#document.title
 * @description document.title and the empty string
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
  document.title = "";
  assert_equals(document.title, "");
}
