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
 * after web-platform-tests/dom/nodes/Node-insertBefore.html
 *
 * @assertion Node.insertBefore
 * @description
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  Element div = new Element.html("""
<div id="test">
  <input type="button" id="testbutton"/>
  <a id="link">Link text</a>
</div>
"""
);
  document.body.append(div);

void testLeafNode(nodeName, Node createNodeFunction() ) {
  test(() {
    var node = createNodeFunction();
    assert_throws("HierarchyRequestError", () { node.insertBefore(null, null); });
  }, "Calling insertBefore with a non-Node first argument on a leaf node " + nodeName + " must throw TypeError.");
  
  test(() {
    var node = createNodeFunction();
    assert_throws("HierarchyRequestError", () { node.insertBefore(new Text("fail"), null); });
    // Would be step 2.
    assert_throws("HierarchyRequestError", () { node.insertBefore(node, null); });
    // Would be step 3.
    assert_throws("HierarchyRequestError", () {
       node.insertBefore(node, new Text("child"));
    });
  }, "Calling insertBefore an a leaf node " + nodeName + " must throw HierarchyRequestError.");
}

testLeafNode("Text",  () { return new Text("Foo"); });
testLeafNode("Comment",  () { return new Comment("Foo"); });

test(() {
  // Step 2.
  assert_throws("HierarchyRequestError", () { document.body.insertBefore(document.body, document.getElementById("log")); });
  assert_throws("HierarchyRequestError", () { document.body.insertBefore(document.documentElement, document.getElementById("log")); });
}, "Calling insertBefore with an inclusive ancestor of the context object must throw HierarchyRequestError.");

// Step 3.
test(() {
  var a = document.createElement("div");
  var b = document.createElement("div");
  var c = document.createElement("div");
  assert_throws("NotFoundError", () {
    a.insertBefore(b, c);
  });
}, "Calling insertBefore with a reference child whose parent is not the context node must throw a NotFoundError.");

// Step 4.1.
test(() {
  var doc = document.implementation.createHtmlDocument("title");
  var doc2 = document.implementation.createHtmlDocument("title2");
  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(doc2, doc.documentElement);
  });

  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(new Text("text"), doc.documentElement);
  });
}, "If the context node is a document, inserting a document or text node should throw a HierarchyRequestError.");

// Step 4.2.1.
test(() {
  var doc = document.implementation.createHtmlDocument("title");
  doc.documentElement.remove();

  var df = doc.createDocumentFragment();
  df.append(doc.createElement("a"));
  df.append(doc.createElement("b"));
  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(df, null);
  });

  df = doc.createDocumentFragment();
  df.append(new Text("text"));
  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(df, null);
  });

  df = doc.createDocumentFragment();
  df.append(new Comment("comment"));
  df.append(new Text("text"));
  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(df, null);
  });
}, "If the context node is a document, appending a DocumentFragment that contains a text node"
" or too many elements should throw a HierarchyRequestError.");

test(() {
  var doc = document.implementation.createHtmlDocument("title");
  doc.documentElement.remove();

  var df = doc.createDocumentFragment();
  df.append(doc.createElement("a"));
  df.append(doc.createElement("b"));
  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(df, doc.firstChild);
  });

  df = doc.createDocumentFragment();
  df.append(new Text("text"));
  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(df, doc.firstChild);
  });

  df = doc.createDocumentFragment();
  df.append(new Comment("comment"));
  df.append(new Text("text"));
  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(df, doc.firstChild);
  });
}, "If the context node is a document, inserting a DocumentFragment that contains a text node"
" or too many elements should throw a HierarchyRequestError.");

// Step 4.2.2.
test(() {
  // The context node has an element child.
  var doc = document.implementation.createHtmlDocument("title");
  var comment = doc.append(new Comment("foo"));

  var df = doc.createDocumentFragment();
  df.append(doc.createElement("a"));

  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(df, doc.documentElement);
  });
  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(df, comment);
  });
  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(df, null);
  });
}, "If the context node is a document, inserting a DocumentFragment with an element"
" if there already is an element child should throw a HierarchyRequestError.");

// Step 4.3.
test(() {
  // The context node has an element child.
  var doc = document.implementation.createHtmlDocument("title");
  var comment = doc.append(new Comment("foo"));

  var a = doc.createElement("a");

  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(a, doc.documentElement);
  });
  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(a, comment);
  });
  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(a, null);
  });
}, "If the context node is a document, inserting an element if there already is an element"
" child should throw a HierarchyRequestError.");

test(() {
  // /child/ is not null and a doctype is following /child/.
  var doc = document.implementation.createHtmlDocument("title");
  var comment = doc.insertBefore(new Comment("foo"), doc.firstChild);
  doc.documentElement.remove();

  var a = doc.createElement("a");
  assert_throws("HierarchyRequestError", () {
    doc.insertBefore(a, comment);
  });
}, "If the context node is a document and a doctype is following the reference child,"
" inserting an element should throw a HierarchyRequestError.");


// Step 5.
test(() {
  var df = document.createDocumentFragment();
  var a = df.append(document.createElement("a"));

  var doc = document.implementation.createHtmlDocument("title");
  assert_throws("HierarchyRequestError", () {
    df.insertBefore(doc, a);
  });
  assert_throws("HierarchyRequestError", () {
    df.insertBefore(doc, null);
  });
}, "If the context node is a DocumentFragment, inserting a document or a doctype should throw a HierarchyRequestError.");

test(() {
  var el = document.createElement("div");
  var a = el.append(document.createElement("a"));

  var doc = document.implementation.createHtmlDocument("title");
  assert_throws("HierarchyRequestError", () {
    el.insertBefore(doc, a);
  });
  assert_throws("HierarchyRequestError", () {
    el.insertBefore(doc, null);
  });
}, "If the context node is an element, inserting a document or a doctype should throw a HierarchyRequestError.");

// Step 7.
test(() {
  var a = document.createElement("div");
  var b = document.createElement("div");
  var c = document.createElement("div");
  a.append(b);
  a.append(c);
  assert_array_equals(a.childNodes, [b, c]);
  assert_equals(b.replaceWith(b), b);
  assert_array_equals(a.childNodes, [b, c]);
  assert_equals(c.replaceWith(c), c);
  assert_array_equals(a.childNodes, [b, c]);
}, "Inserting a node before itself should not move the node");

checkTestFailures();
}
