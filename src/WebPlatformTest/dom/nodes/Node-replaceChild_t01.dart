/*
 * after web-platform-tests/dom/nodes/Node-replaceChild.html
 *
 * @assertion Node.replaceWith
 * @description
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

// IDL.
test(() {
  var b = document.createElement("div");
  assert_throws("TypeError", () {
    b.replaceWith(null);
  });
}, "Passing null to replaceWith should throw a TypeError.");

// Step 1.
test(() {
  var a = document.createElement("div");
  var b = document.createElement("div");
  var c = document.createElement("div");
  assert_throws("NotFoundError", () {
    c.replaceWith(b);
  });

  var d = document.createElement("div");
  d.append(b);
  assert_throws("NotFoundError", () {
    c.replaceWith(b);
  });
  assert_throws("NotFoundError", () {
    c.replaceWith(a);
  });
  assert_throws("NotFoundError", () {
    a.replaceWith(b);
  });
  assert_throws("NotFoundError", () {
    a.replaceWith(a);
  });
}, "If child's parent is not the context node, a NotFoundError exception should be thrown");

test(() {
  var nodes = [
    document.implementation.createDocumentType("html", "", ""),
    new Text("text"),
//    document.implementation.createDocument(null, "foo", null).createProcessingInstruction("foo", "bar"),
    new Comment("comment")
  ];

  var a = document.createElement("div");
  var b = document.createElement("div");
  nodes.forEach((node) {
    assert_throws("HierarchyRequestError", () {
      b.replaceWith(a);
    });
  });
}, "If the context node is not a node that can contain children, a NotFoundError exception should be thrown");

// Step 2.
test(() {
  var a = document.createElement("div");
  var b = document.createElement("div");
  a.append(b);
  assert_throws("HierarchyRequestError", () {
    b.replaceWith(a);
  });

  var c = document.createElement("div");
  c.append(a);
  assert_throws("HierarchyRequestError", () {
    b.replaceWith(c);
  });
}, "If node is an inclusive ancestor of the context node, a HierarchyRequestError should be thrown.");


// Step 3.1.
test(() {
  var doc = document.implementation.createHtmlDocument("title");
  var doc2 = document.implementation.createHtmlDocument("title2");
  assert_throws("HierarchyRequestError", () {
    doc.documentElement.replaceWith(doc2);
  });

  assert_throws("HierarchyRequestError", () {
    doc.documentElement.replaceWith(new Text("text"));
  });
}, "If the context node is a document, inserting a document or text node should throw a HierarchyRequestError.");

// Step 3.2.1.
test(() {
  var doc = document.implementation.createHtmlDocument("title");

  var df = doc.createDocumentFragment();
  df.append(doc.createElement("a"));
  df.append(doc.createElement("b"));
  assert_throws("HierarchyRequestError", () {
    doc.documentElement.replaceWith(df);
  });

  df = doc.createDocumentFragment();
  df.append(new Text("text"));
  assert_throws("HierarchyRequestError", () {
    doc.documentElement.replaceWith(df);
  });

  df = doc.createDocumentFragment();
  df.append(new Comment("comment"));
  df.append(new Text("text"));
  assert_throws("HierarchyRequestError", () {
    doc.documentElement.replaceWith(df);
  });
}, "If the context node is a document, inserting a DocumentFragment that contains a text node "
"or too many elements should throw a HierarchyRequestError.");

/*
test(() {
  var doc = document.implementation.createHtmlDocument("title");
  doc.documentElement.remove();

  var df = doc.createDocumentFragment();
  df.append(doc.createElement("a"));
  df.append(doc.createElement("b"));
  assert_throws("HierarchyRequestError", () {
    doc.replaceChild(df, doc.doctype);
  });
}, "If the context node is a document (without element children), inserting a DocumentFragment "
"that contains multiple elements should throw a HierarchyRequestError.");
*/

// Step 3.2.2.
test(() {
  // The context node has an element child that is not /child/.
  var doc = document.implementation.createHtmlDocument("title");
  var comment = doc.append(new Comment("foo"));
//  assert_array_equals(doc.childNodes, [doc.doctype, doc.documentElement, comment]);

  var df = doc.createDocumentFragment();
  df.append(doc.createElement("a"));
  assert_throws("HierarchyRequestError", () {
    comment.replaceWith(df);
  });
  /*
  assert_throws("HierarchyRequestError", () {
    doc.replaceWith(df, doc.doctype);
  });
  */
}, "If the context node is a document, inserting a DocumentFragment with an element"
" if there already is an element child should throw a HierarchyRequestError.");

test(() {
  // A doctype is following /child/.
  var doc = document.implementation.createHtmlDocument("title");
  var comment = doc.insertBefore(new Comment("foo"), doc.firstChild);
  doc.documentElement.remove();
//  assert_array_equals(doc.childNodes, [comment, doc.doctype]);

  var df = doc.createDocumentFragment();
  df.append(doc.createElement("a"));
  assert_throws("HierarchyRequestError", () {
    comment.replaceWith(df);
  });
}, "If the context node is a document, inserting a DocumentFragment with an element before"
" the doctype should throw a HierarchyRequestError.");

// Step 3.3.
test(() {
  var doc = document.implementation.createHtmlDocument("title");
  var comment = doc.append(new Comment("foo"));
//  assert_array_equals(doc.childNodes, [doc.doctype, doc.documentElement, comment]);

  var a = doc.createElement("a");
  assert_throws("HierarchyRequestError", () {
    comment.replaceWith(a);
  });
  /*
  assert_throws("HierarchyRequestError", () {
    doc.replaceChild(a, doc.doctype);
  });
  */
}, "If the context node is a document, inserting an element if there already is an element "
"child should throw a HierarchyRequestError.");

test(() {
  var doc = document.implementation.createHtmlDocument("title");
  var comment = doc.insertBefore(new Comment("foo"), doc.firstChild);
  doc.documentElement.remove();
 // assert_array_equals(doc.childNodes, [comment, doc.doctype]);

  var a = doc.createElement("a");
  assert_throws("HierarchyRequestError", () {
    comment.replaceWith(a);
  });
}, "If the context node is a document, inserting an element before the doctype should throw a HierarchyRequestError.");

/*
// Step 3.4.
test(() {
  var doc = document.implementation.createHtmlDocument("title");
  var comment = doc.insertBefore(new Comment("foo"), doc.firstChild);
 // assert_array_equals(doc.childNodes, [comment, doc.doctype, doc.documentElement]);

  var doctype = document.implementation.createDocumentType("html", "", "");
  assert_throws("HierarchyRequestError", () {
    comment.replaceWith(doctype);
  });
  assert_throws("HierarchyRequestError", () {
    doc.documentElement.replaceWith(doctype);
  });
}, "If the context node is a document, inserting a doctype if there already is a doctype "
"child should throw a HierarchyRequestError.");
*/

/*
test(() {
  var doc = document.implementation.createHtmlDocument("title");
  var comment = doc.append(new Comment("foo"));
  doc.doctype.remove();
  assert_array_equals(doc.childNodes, [doc.documentElement, comment]);

  var doctype = document.implementation.createDocumentType("html", "", "");
  assert_throws("HierarchyRequestError", () {
    comment.replaceWith(doctype);
  });
}, "If the context node is a document, inserting a doctype after the document element "
"should throw a HierarchyRequestError.");
*/

// Step 4.
test(() {
  var df = document.createDocumentFragment();
  var a = df.append(document.createElement("a"));

  var doc = document.implementation.createHtmlDocument("title");
  assert_throws("HierarchyRequestError", () {
    a.replaceWith(doc);
  });

  var doctype = document.implementation.createDocumentType("html", "", "");
  assert_throws("HierarchyRequestError", () {
    a.replaceWith(doctype);
  });
}, "If the context node is a DocumentFragment, inserting a document or a doctype should throw a HierarchyRequestError.");

test(() {
  var el = document.createElement("div");
  var a = el.append(document.createElement("a"));

  var doc = document.implementation.createHtmlDocument("title");
  assert_throws("HierarchyRequestError", () {
    a.replaceWith(doc);
  });

  var doctype = document.implementation.createDocumentType("html", "", "");
  assert_throws("HierarchyRequestError", () {
    a.replaceWith(doctype);
  });
}, "If the context node is an element, inserting a document or a doctype should throw a HierarchyRequestError.");

// Step 6.
test(() {
  var a = document.createElement("div");
  var b = document.createElement("div");
  var c = document.createElement("div");
  a.append(b);
  a.append(c);
  assert_array_equals(a.childNodes, [b, c]);
  b.replaceWith(c);
  assert_array_equals(a.childNodes, [c]);
}, "Replacing a node with its next sibling should work (2 children)");

test(() {
  var a = document.createElement("div");
  var b = document.createElement("div");
  var c = document.createElement("div");
  var d = document.createElement("div");
  var e = document.createElement("div");
  a.append(b);
  a.append(c);
  a.append(d);
  a.append(e);
  assert_array_equals(a.childNodes, [b, c, d, e]);
  c.replaceWith(d);
  assert_array_equals(a.childNodes, [b, d, e]);
}, "Replacing a node with its next sibling should work (4 children)");

/* document.doctype not implemented in Dart
// Step 7.
test(() {
  var doc = document.implementation.createHtmlDocument("title");
  var doctype = doc.doctype;
  assert_array_equals(doc.childNodes, [doctype, doc.documentElement]);

  var doc2 = document.implementation.createHtmlDocument("title2");
  var doctype2 = doc2.doctype;
  assert_array_equals(doc2.childNodes, [doctype2, doc2.documentElement]);

  doc.doctype.replaceWith(doc2.doctype);
  assert_array_equals(doc.childNodes, [doctype2, doc.documentElement]);
  assert_array_equals(doc2.childNodes, [doc2.documentElement]);
  assert_equals(doctype.parentNode, null);
  assert_equals(doctype.ownerDocument, doc);
  assert_equals(doctype2.parentNode, doc);
  assert_equals(doctype2.ownerDocument, doc);
}, "If the context node is a document, inserting a new doctype should work.");
*/

// Bugs.
test(() {
  var doc = document.implementation.createHtmlDocument("title");
  var df = doc.createDocumentFragment();
  var a = df.append(doc.createElement("a"));
  assert_equals(doc.documentElement, doc.documentElement.replaceWith(df));
//  assert_array_equals(doc.childNodes, [doc.doctype, a]);
}, "Replacing the document element with a DocumentFragment containing a single element should work.");

test(() {
  var doc = document.implementation.createHtmlDocument("title");
  var df = doc.createDocumentFragment();
  var a = df.append(new Comment("a"));
  var b = df.append(doc.createElement("b"));
  var c = df.append(new Comment("c"));
  assert_equals(doc.documentElement, doc.documentElement.replaceWith(df));
//  assert_array_equals(doc.childNodes, [doc.doctype, a, b, c]);
}, "Replacing the document element with a DocumentFragment containing a single element and comments should work.");

test(() {
  var doc = document.implementation.createHtmlDocument("title");
  var a = doc.createElement("a");
  assert_equals(doc.documentElement, doc.documentElement.replaceWith(a));
//  assert_array_equals(doc.childNodes, [doc.doctype, a]);
}, "Replacing the document element with a single element should work.");

checkTestFailures();
}
