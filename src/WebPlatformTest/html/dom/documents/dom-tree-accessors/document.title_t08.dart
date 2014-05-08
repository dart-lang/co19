/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.title-08.html
 * @assertion http://www.w3.org/html/wg/drafts/html/master/#document.title
 * @description 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {

test(() {
  assert_equals(document.title, "");
}, "No title element");

test(() {
  var title = document.createElement("title");
  title.appendChild(document.createTextNode("PASS"));
  document.head.append(title);
  assert_equals(document.title, "PASS");

  title.appendChild(document.createTextNode("PASS2"));
  title.appendChild(document.createTextNode("PASS3"));
  assert_equals(document.title, "PASSPASS2PASS3");
}, "title element contains multiple child text nodes");

}
