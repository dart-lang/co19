/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.body-setter-01.html
 * @assertion Setting document.body to incorrect values
 * @description 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {

var originalBody = document.body;

test(() {
  assert_throws(new TypeError(), () {
    document.body = "text";
  });
}, "Should throw a TypeError when trying to set document.body to a string.");

test(() {
  assert_throws("HierarchyRequestError", () {
    document.body = document.createElement("div");
  });
}, "Should throw a HierarchyRequestError when trying to set document.body to a div element.");

test(() {
  var doc = document.implementation.createHTMLDocument("");
  doc.removeChild(doc.documentElement);
  assert_throws("HierarchyRequestError", () {
    doc.body = document.createElement("body");
  });
}, "Should throw a HierarchyRequestError when trying to set document.body when there's no root element.");

test(() {
  assert_equals(document.body, originalBody);
}, "document.body has not changed");

checkTestFailures();
}
