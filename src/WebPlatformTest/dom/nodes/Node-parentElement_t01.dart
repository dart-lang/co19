/*
 * after web-platform-tests/dom/nodes/Node-parentElement.html
 *
 * @assertion Node.parent
 * @description
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

test(() {
  assert_equals(document.parent, null);
}, "When the parent is null, parent should be null");

/*
test(() {
  assert_equals(document.doctype.parent, null);
}, "When the parent is a document, parent should be null (doctype)");
*/

test(() {
  assert_equals(document.documentElement.parent, null);
}, "When the parent is a document, parent should be null (element)");

test(() {
  var comment = document.append(new Comment("foo"));
  assert_equals(comment.parent, null);
}, "When the parent is a document, parent should be null (comment)");

test(() {
  var df = document.createDocumentFragment();
  assert_equals(df.parent, null);
  var el = document.createElement("div");
  assert_equals(el.parent, null);
  df.append(el);
  assert_equals(el.parentNode, df);
  assert_equals(el.parent, null);
}, "parent should return null for children of DocumentFragments (element)");

test(() {
  var df = document.createDocumentFragment();
  assert_equals(df.parent, null);
  var text = new Text("bar");
  assert_equals(text.parent, null);
  df.append(text);
  assert_equals(text.parentNode, df);
  assert_equals(text.parent, null);
}, "parent should return null for children of DocumentFragments (text)");

test(() {
  var df = document.createDocumentFragment();
  var parent = document.createElement("div");
  df.append(parent);
  var el = document.createElement("div");
  assert_equals(el.parent, null);
  parent.append(el);
  assert_equals(el.parent, parent);
}, "parent should work correctly with DocumentFragments (element)");

test(() {
  var df = document.createDocumentFragment();
  var parent = document.createElement("div");
  df.append(parent);
  var text = new Text("bar");
  assert_equals(text.parent, null);
  parent.append(text);
  assert_equals(text.parent, parent);
}, "parent should work correctly with DocumentFragments (text)");

test(() {
  var parent = document.createElement("div");
  var el = document.createElement("div");
  assert_equals(el.parent, null);
  parent.append(el);
  assert_equals(el.parent, parent);
}, "parent should work correctly in disconnected subtrees (element)");

test(() {
  var parent = document.createElement("div");
  var text = new Text("bar");
  assert_equals(text.parent, null);
  parent.append(text);
  assert_equals(text.parent, parent);
}, "parent should work correctly in disconnected subtrees (text)");

test(() {
  var el = document.createElement("div");
  assert_equals(el.parent, null);
  document.body.append(el);
  assert_equals(el.parent, document.body);
}, "parent should work correctly in a document (element)");

test(() {
  var text = document.createElement("div");
  assert_equals(text.parent, null);
  document.body.append(text);
  assert_equals(text.parent, document.body);
}, "parent should work correctly in a document (text)");

checkTestFailures();
}
