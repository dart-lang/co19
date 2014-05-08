/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.title-03.html
 * @assertion http://www.whatwg.org/html5/#document.title
 * @description document.title  and space normalization 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {

  document.title = "one space";
  assert_equals(document.title, "one space");

  document.title = "two  spaces";
  assert_equals(document.title, "two spaces");

  document.title = "one\ttab";
  assert_equals(document.title, "one tab");

  document.title = "two\t\ttabs";
  assert_equals(document.title, "two tabs");

  document.title = "one\nnewline";
  assert_equals(document.title, "one newline");

  document.title = "two\n\nnewlines";
  assert_equals(document.title, "two newlines");

  document.title = "one\fform feed";
  assert_equals(document.title, "one form feed");

  document.title = "two\f\fform feeds";
  assert_equals(document.title, "two form feeds");

  document.title = "one\rcarriage return";
  assert_equals(document.title, "one carriage return");

  document.title = "two\r\rcarriage returns";
  assert_equals(document.title, "two carriage returns");
}
