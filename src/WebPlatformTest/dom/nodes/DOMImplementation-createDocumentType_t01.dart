/*
 * after web-platform-tests/dom/nodes/DOMImplementation-createDocumentType.html
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-domimplementation-createdocumenttype">
 *
 * @assertion DOMImplementation.createDocumentType(qualifiedName, publicId, systemId)
 *
 * @description 
 * @needsreview dart issue #18259 DocumentType is not documented
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

var tests = [
        ["foo", "", "", null],
        ["1foo", "", "", "InvalidCharacterError"],
        ["foo1", "", "", null],
        ["f1oo", "", "", null],
        ["@foo", "", "", "InvalidCharacterError"],
        ["foo@", "", "", "InvalidCharacterError"],
        ["f@oo", "", "", "InvalidCharacterError"],
        ["f:oo", "", "", null],
        [":foo", "", "", "NamespaceError"],
        ["foo:", "", "", "NamespaceError"],
        ["foo", "foo", "", null],
        ["foo", "", "foo", null],
        ["foo", "f'oo", "", null],
        ["foo", "", "f'oo", null],
        ["foo", 'f"oo', "", null],
        ["foo", "", 'f"oo', null],
        ["foo", "f'o\"o", "", null],
        ["foo", "", "f'o\"o", null],
        ["foo", "foo>", "", null],
        ["foo", "", "foo>", null]
     ];

void main() {

  var doc = document.implementation.createHtmlDocument("title");
  Expect.isTrue(doc is HtmlDocument, "${doc.runtimeType}");

  void doTest(aDocument, aQualifiedName, aPublicId, aSystemId) {
    var doctype = aDocument.implementation.createDocumentType(aQualifiedName, aPublicId, aSystemId);
 //   assert_equals(doctype.name, aQualifiedName, "name");  TODO update after the bug resolution
  //  assert_equals(doctype.publicId, aPublicId, "publicId");
  //  assert_equals(doctype.systemId, aSystemId, "systemId");
    assert_equals(doctype.ownerDocument, aDocument, "ownerDocument");
  }

  tests.forEach((t) {
    var qualifiedName = t[0], publicId = t[1], systemId = t[2], expected = t[3];
    test(() {
      if (expected!=null) {
        assert_throws(expected, () {
          document.implementation.createDocumentType(qualifiedName, publicId, systemId);
        });
      } else {
        doTest(document, qualifiedName, publicId, systemId);
        doTest(doc, qualifiedName, publicId, systemId);
      }
    }, "createDocumentType($qualifiedName, $publicId, $systemId) should " +
       (expected ? "throw " + expected : "work"));
  });

checkTestFailures();
}