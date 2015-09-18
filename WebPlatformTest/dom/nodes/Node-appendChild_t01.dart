/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
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
    assert_throws("TypeError: Failed to execute 'appendChild' on 'Node': parameter 1 is not of type 'Node'.", () { node.append(null); });
  }, "Appending null to a " + desc);

  // Pre-insert step 1.
  test(() {
    assert_throws("HierarchyRequestError", () { node.append(new Text("fail")); });
  }, "Appending to a " + desc);
}

// WebIDL.
test(() {
  assert_throws("TypeError: Failed to execute 'appendChild' on 'Node': parameter 1 is not of type 'Node'.", () { document.body.append(null); });
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
