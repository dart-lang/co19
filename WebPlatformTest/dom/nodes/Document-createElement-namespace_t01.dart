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
 * after web-platform-tests/dom/nodes/Document-createElement-namespace.html
 *
 * @description
 * This tests the namespace of elements created by the Document interface's
 * createElement() method.  See bug:
 * https://www.w3.org/Bugs/Public/show_bug.cgi?id=19431
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

/**
 * Test that an element created using the Document object doc has the namespace
 * that would be expected for the given contentType.
 */
 void testDoc(doc, contentType) {
  // WebKit doesn't support document.contentType, so they don't get this sanity
  // check :(
  if (doc.contentType != null) {
    assert_equals(doc.contentType, contentType,
                  "Wrong MIME type -- incorrect server config?");
  }

  var expectedNamespace = contentType == "text/html" ||
                          contentType == "application/xhtml+xml"
                          ? "http://www.w3.org/1999/xhtml" : null;

  assert_equals(doc.createElement("x").namespaceURI, expectedNamespace);
}

void main() {

// First test various objects we create in JS
test(() {
  testDoc(document, "text/html");
}, "Created element's namespace in current document");
test(() {
  testDoc(document.implementation.createHTMLDocument(""), "text/html");
}, "Created element's namespace in created HTML document");
test(() {
  testDoc(document.implementation.createDocument(null, "", null),
          "application/xml");
}, "Created element's namespace in created XML document");
test(() {
  testDoc(document.implementation.createDocument("http://www.w3.org/1999/xhtml", "html", null),
          "application/xml");
}, "Created element's namespace in created XHTML document");
test(() {
  testDoc(document.implementation.createDocument("http://www.w3.org/2000/svg", "svg", null),
          "application/xml");
}, "Created element's namespace in created SVG document");

test(() {
  testDoc(document.implementation.createDocument("http://www.w3.org/1998/Math/MathML", "math", null),
          "application/xml");
}, "Created element's namespace in created MathML document");

// Now for various externally-loaded files.  Note: these lists must be kept
// synced with the lists in generate.py in the subdirectory, and that script
// must be run whenever the lists are updated.  (We could keep the lists in a
// shared JSON file, but it seems like too much effort.)
var testExtensions = {
  "html": "text/html",
  "xhtml": "application/xhtml+xml",
  "xml": "application/xml",
  "svg": "image/svg+xml",
  // Was not able to get server MIME type working properly :(
  //mml: "application/mathml+xml",
};
return;

var tests = [
  "empty",
  "minimal_html",
  
  "xhtml",
  "svg",
  "mathml",

  "bare_xhtml",
  "bare_svg",
  "bare_mathml",

  "xhtml_ns_removed",
  "xhtml_ns_changed",
];

asyncMultiStart(tests.length);
tests.forEach((testName) {
  testExtensions.forEach((ext, mtype) {
    var iframe = document.createElement("iframe");
    iframe.src = "Document-createElement-namespace-tests/$testName.$ext";
//    var t = async_test("Created element's namespace in $testName.$ext);
    iframe.onLoad.forEach((el) {
      testDoc(iframe.contentDocument, mtype);
      document.body.removeChild(iframe);
      asyncEnd();
    });
    document.body.appendChild(iframe);
  });
});

checkTestFailures();
}
