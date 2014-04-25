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