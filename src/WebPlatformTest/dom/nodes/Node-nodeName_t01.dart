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
 * after web-platform-tests/dom/nodes/Node-nodeName.html
 *
 * @assertion Node.nodeName
 * @description
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

test(() {
  var HTMLNS = "http://www.w3.org/1999/xhtml",
      SVGNS = "http://www.w3.org/2000/svg";
  assert_equals(document.createElementNS(HTMLNS, "I").nodeName, "I");
  assert_equals(document.createElementNS(HTMLNS, "i").nodeName, "I");
  assert_equals(document.createElementNS(SVGNS, "svg").nodeName, "svg");
  assert_equals(document.createElementNS(SVGNS, "SVG").nodeName, "SVG");
  assert_equals(document.createElementNS(HTMLNS, "x:b").nodeName, "x:b"); // was: X:B
}, "For Element nodes, nodeName should return the same as tagName.");

test(() {
  assert_equals(new Text("foo").nodeName, "#text");
}, "For Text nodes, nodeName should return \"#text\".");

test(() {
  assert_equals(new Comment("foo").nodeName, "#comment");
}, "For Comment nodes, nodeName should return \"#comment\".");

test(() {
  assert_equals(document.nodeName, "#document");
}, "For Document nodes, nodeName should return \"#document\".");

/*
test(() {
  assert_equals(document.doctype.nodeName, "html");
}, "For DocumentType nodes, nodeName should return the name.");
*/

test(() {
  assert_equals(document.createDocumentFragment().nodeName,
                "#document-fragment");
}, "For DocumentFragment nodes, nodeName should return \"#document-fragment\".");

checkTestFailures();
}
