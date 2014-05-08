/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.head-02.html
 * @assertion http://www.whatwg.org/html5/#dom-document-head
 * @description document.head
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
  var HTML = "http://www.w3.org/1999/xhtml";
  var head = document.getElementsByTagName("head")[0];
  assert_equals(document.head, head);
  var head2 = document.createElementNS(HTML, "blah:head");
  document.documentElement.insertBefore(head2, head);
  assert_equals(document.head, head2);
  var head3 = document.createElementNS("http://www.example.org/", "blah:head");
  document.documentElement.insertBefore(head3, head2);
  assert_equals(document.head, head2);
}
