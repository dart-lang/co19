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
      if (expected != null) {
        assert_throws(expected, () {
          document.implementation.createDocumentType(qualifiedName, publicId, systemId);
        });
      } else {
        doTest(document, qualifiedName, publicId, systemId);
        doTest(doc, qualifiedName, publicId, systemId);
      }
    }, "createDocumentType($qualifiedName, $publicId, $systemId) should " +
       (expected != null ? "throw " + expected : "work"));
  });

checkTestFailures();
}
