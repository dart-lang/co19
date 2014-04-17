/*
 * after web-platform-tests/dom/nodes/Node-appendChild.html
 *
 * @assertion Node.append
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-node-append">
 * @description
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

IFrameElement iframe=new Element.html("<iframe>some text</iframe>");
var frameDoc = iframe.firstChild.ownerDocument;

// TODO: Exhaustive tests
 testLeaf(node, desc) {
  // WebIDL.
  test(() {
    assert_throws("HierarchyRequestError", () { node.append(null); });
  }, "Appending null to a " + desc);

  // Pre-insert step 1.
  test(() {
    assert_throws("HierarchyRequestError", () { node.append(new Text("fail")); });
  }, "Appending to a " + desc);
}

// WebIDL.
test(() {
  assert_throws("NotFoundError", () { document.body.append(null); });
//  assert_throws("TypeError", () { document.body.append({'a':'b'}); }); -- separate test Node-appendChild_t02
}, "WebIDL tests");

// WebIDL and pre-insert step 1.
 testLeaf(new Text("Foo"), "text node");
 testLeaf(new Comment("Foo"), "comment");
// testLeaf(document.doctype, "doctype");

// Pre-insert step 5.
test(() {
  assert_throws("HierarchyRequestError", () { document.body.append(frameDoc); });
}, "Appending a document");

// Pre-insert step 8.
test(() {
  var s = frameDoc.createElement("a");
  assert_equals(s.ownerDocument, frameDoc);
  document.body.append(s);
  assert_equals(s.ownerDocument, document);
}, "Adopting an orphan");

test(() {
  var s = frameDoc.createElement("b");
  assert_equals(s.ownerDocument, frameDoc);
  frameDoc.body.append(s);
  assert_equals(s.ownerDocument, frameDoc);
  document.body.append(s);
  assert_equals(s.ownerDocument, document);
}, "Adopting a non-orphan");

checkTestFailures();
}
