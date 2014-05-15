/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.body-getter.html
 * @assertion Document.body
 * @description 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {

void createDocument() {
  var doc = document.implementation.createHTMLDocument("");
  doc.removeChild(doc.documentElement);
  return doc;
}

test(() {
  var doc = createDocument();
  assert_equals(doc.body, null);
}, "Childless document");

test(() {
  var doc = createDocument();
  doc.appendChild(doc.createElement("html"));
  assert_equals(doc.body, null);
}, "Childless html element");

test(() {
  var doc = createDocument();
  var html = doc.appendChild(doc.createElement("html"));
  var b =
    html.appendChild(doc.createElement("body"));
  html.appendChild(doc.createElement("frameset"));
  assert_equals(doc.body, b);
}, "Body followed by frameset inside the html element");

test(() {
  var doc = createDocument();
  var html = doc.appendChild(doc.createElement("html"));
  var f =
    html.appendChild(doc.createElement("frameset"));
  html.appendChild(doc.createElement("body"));
  assert_equals(doc.body, f);
}, "Frameset followed by body inside the html element");

test(() {
  var doc = createDocument();
  var html =
    doc.appendChild(doc.createElementNS("http://example.org/test", "html"));
  html.appendChild(doc.createElement("body"));
  html.appendChild(doc.createElement("frameset"));
  assert_equals(doc.body, null);
}, "Body followed by frameset inside a non-HTML html element");

test(() {
  var doc = createDocument();
  var html =
    doc.appendChild(doc.createElementNS("http://example.org/test", "html"));
  html.appendChild(doc.createElement("frameset"));
  html.appendChild(doc.createElement("body"));
  assert_equals(doc.body, null);
}, "Frameset followed by body inside a non-HTML html element");

test(() {
  var doc = createDocument();
  var html = doc.appendChild(doc.createElement("html"));
  html.appendChild(
    doc.createElementNS("http://example.org/test", "body"));
  var b = html.appendChild(doc.createElement("body"));
  assert_equals(doc.body, b);
}, "Non-HTML body followed by body inside the html element");

test(() {
  var doc = createDocument();
  var html = doc.appendChild(doc.createElement("html"));
  html.appendChild(
    doc.createElementNS("http://example.org/test", "frameset"));
  var b = html.appendChild(doc.createElement("body"));
  assert_equals(doc.body, b);
}, "Non-HTML frameset followed by body inside the html element");

test(() {
  var doc = createDocument();
  var html = doc.appendChild(doc.createElement("html"));
  var x = html.appendChild(doc.createElement("x"));
  x.appendChild(doc.createElement("body"));
  var body = html.appendChild(doc.createElement("body"));
  assert_equals(doc.body, body);
}, "Body inside an x element followed by a body");
test(() {
  var doc = createDocument();
  var html = doc.appendChild(doc.createElement("html"));
  var x = html.appendChild(doc.createElement("x"));
  x.appendChild(doc.createElement("frameset"));
  var frameset = html.appendChild(doc.createElement("frameset"));
  assert_equals(doc.body, frameset);
}, "Frameset inside an x element followed by a frameset");

// Root node is not a html element.
test(() {
  var doc = createDocument();
  doc.appendChild(doc.createElement("body"));
  assert_equals(doc.body, null);
}, "Body as the root node");

test(() {
  var doc = createDocument();
  doc.appendChild(doc.createElement("frameset"));
  assert_equals(doc.body, null);
}, "Frameset as the root node");

test(() {
  var doc = createDocument();
  var body = doc.appendChild(doc.createElement("body"));
  body.appendChild(doc.createElement("frameset"));
  assert_equals(doc.body, null);
}, "Body as the root node with a frameset child");

test(() {
  var doc = createDocument();
  var frameset = doc.appendChild(doc.createElement("frameset"));
  frameset.appendChild(doc.createElement("body"));
  assert_equals(doc.body, null);
}, "Frameset as the root node with a body child");

test(() {
  var doc = createDocument();
  doc.appendChild(doc.createElementNS("http://example.org/test", "body"));
  assert_equals(doc.body, null);
}, "Non-HTML body as the root node");

test(() {
  var doc = createDocument();
  doc.appendChild(doc.createElementNS("http://example.org/test", "frameset"));
  assert_equals(doc.body, null);
}, "Non-HTML frameset as the root node");

checkTestFailures();
}
