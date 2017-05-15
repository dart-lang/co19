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
 * after web-platform-tests/dom/nodes/Node-isEqualNode.xhtml
 *
 * @assertion Node.isEqualNode
 * @description
 */

import 'dart:async';
import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  document.body.appendHtml("""
<iframe id="subset1"  src="data:application/xml,&lt;!DOCTYPE foo [ &lt;!ELEMENT foo (%23PCDATA)> ]>&lt;foo/>" />
<iframe id="subset2"  src="data:application/xml,&lt;!DOCTYPE foo [ &lt;!ELEMENT foo EMPTY> ]>&lt;foo/>" />
""", treeSanitizer: NodeTreeSanitizer.trusted);

void testNullHandling(node) {
  test(() {
    assert_false(node == null);
  }, "testNullHandling");
}

[
  document.createElement("foo"),
  new Text("foo"),
//  document.createProcessingInstruction("foo", "bar"),
  new Comment("foo"),
  document,
  document.implementation.createDocumentType("html", "", ""),
  document.createDocumentFragment()
].forEach(testNullHandling);

test(() {
  var a = document.createElement("foo");
  a.setAttribute("a", "bar");
  a.setAttribute("b", "baz");
  var b = document.createElement("foo");
  b.setAttribute("b", "baz");
  b.setAttribute("a", "bar");
  assert_true(a == b);
}, "isEqualNode should return true when the attributes are in a different order");

test(() {
  var a = document.createElement("foo");
  a.setAttributeNS("ns", "x:a", "bar");
  var b = document.createElement("foo");
  b.setAttributeNS("ns", "y:a", "bar");
  assert_true(a == b);
}, "isEqualNode should return true when the attributes have different prefixes");

/*
var internalSubset = async_test("isEqualNode should return true when only the internal subsets of DocumentTypes differ.");
var wait = 2;;

 iframeLoaded() {
  if (!--wait) {
    internalSubset.step(() {
      var doc1 = document.getElementById("subset1").contentDocument;
      var doc2 = document.getElementById("subset2").contentDocument;
      assert_true(doc1.doctype.isEqualNode(doc2.doctype), "doc1.doctype.isEqualNode(doc2.doctype)");
      assert_true(doc1.isEqualNode(doc2), "doc1.isEqualNode(doc2)");
    });
    internalSubset.done();
  }
}
*/

test(() {
  IFrameElement subset1 = document.getElementById("subset1");
  IFrameElement subset2 = document.getElementById("subset2");

  Future f1 = subset1.onLoad.drain();
  Future f2 = subset1.onLoad.drain();

  asyncStart();
  Future.wait([f1, f2]).then((v) {
      var doc1 = subset1.contentDocument;
      var doc2 = subset2.contentDocument;
//      assert_true(doc1.doctype.isEqualNode(doc2.doctype), "doc1.doctype.isEqualNode(doc2.doctype)");
      assert_true(doc1 == doc2, "doc1.isEqualNode(doc2)");
      asyncEnd();
    },
    onError: (e) {
        throw e;
    });
}, "isEqualNode should return true when only the internal subsets of DocumentTypes differ.");

checkTestFailures();
}
