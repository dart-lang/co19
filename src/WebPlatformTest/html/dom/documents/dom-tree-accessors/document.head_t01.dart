/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.head-01.html
 * @assertion http://www.whatwg.org/html5/#dom-document-head
 * @description document.head
 * the referenced spec does not allow to assign the head property
 * changed the test to check for exception 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
  var head = document.getElementsByTagName("head")[0];
  assert_equals(document.head, head);
  document.documentElement.append(document.createElement("head"));
  assert_equals(document.head, head);
  var head2 = document.createElement("head");
  document.documentElement.insertBefore(head2, head);
  assert_equals(document.head, head2);
  Expect.throws((){
    document.head = "";
  });
}
