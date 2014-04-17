/*
 * after web-platform-tests/dom/nodes/Document-adoptNode.html
 *
 * @assertion Document.adoptNode
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-document-adoptnode">
 * creates an element with local name "x<
 * @needsreview #18259  DocumentType is not documented
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";
import "../../testcommon.dart";

void main() {
test(() {
  Element el = new Element.html('<x<>x</x<>',
      treeSanitizer: new NullTreeSanitizer());
  document.body.append(el);
  var y = document.getElementsByTagName("x<")[0];
  print("y=$y");
  assert_equals(y.parentNode, document.body);
  assert_equals(y.ownerDocument, document);
  assert_equals(document.adoptNode(y), y);
  assert_equals(y.parentNode, null);
  assert_equals(y.ownerDocument, document);
  var doc = document.implementation.createDocument(null, null, null);
  assert_equals(doc.adoptNode(y), y);
  assert_equals(y.parentNode, null);
  assert_equals(y.ownerDocument, doc);
}, "Adopting an Element called 'x<' should work.");

test(() {
  var x = document.createElement(":good:times:");
  assert_equals(document.adoptNode(x), x);
  var doc = document.implementation.createDocument(null, null, null);
  assert_equals(doc.adoptNode(x), x);
  assert_equals(x.parentNode, null);
  assert_equals(x.ownerDocument, doc);
}, "Adopting an Element called ':good:times:' should work.");

test(() {
//  var doctype = document.docType; // what is its dart equivalent?
  var doctype = document.implementation.createDocumentType("foo", "", "");
  assert_equals(doctype.parentNode, null, "eq1");
  assert_equals(doctype.ownerDocument, document, "eq2");
  var doctype2;
  try {
    doctype2=document.adoptNode(doctype);
  } catch (e) {
    Expect.fail("adoptNode(DocumentType) failed: $e");
  }
  assert_equals(doctype2, doctype, "eq3");
  assert_equals(doctype.parentNode, document, "eq4");
  assert_equals(doctype.ownerDocument, document, "eq5");
}, "Explicitly adopting a DocumentType should work.");

test(() {
  var doc = document.implementation.createDocument(null, null, null);
  assert_throws("NotSupportedError", () { document.adoptNode(doc); });
}, "Adopting a Document should throw.");

checkTestFailures();
}
