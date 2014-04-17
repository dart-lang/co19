/*
 * after web-platform-tests/dom/nodes/Document-getElementsByTagName.html
 *
 * @assertion Document.getElementsByTagName()
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-document-getelementsbytagname">
 *
 * @description 
 * @needsreview dart issue #18240 Document.getElementsByTagName returns NodeList, not HtmlCollection
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

// TODO: getElementsByTagName("*")
test(() {
  val lst=document.getElementsByTagName("html");
//  assert_false(lst is NodeList,  "Should not return a NodeList");  - why?
  assert_true(lst is HtmlCollection, "Should return an HtmlCollection");
}, "Interfaces");

test(() {
  var l = document.getElementsByTagName("nosuchtag");
  assert_throws("Unsupported operation", () {
    l[5] = "foopy";
  });
}, "Shouldn't be able to set unsigned properties on a HtmlCollection (non-strict mode)");

/* TODO how to set strict mode?
test(() {
  var l = document.getElementsByTagName("nosuchtag");
  assert_throws("Unsupported operation", () {
    "use strict";
    l[5] = "foopy";
  });
}, "Shouldn't be able to set unsigned properties on a HtmlCollection (strict mode)");
*/

test(() {
  assert_equals(document.createElementNS("http://www.w3.org/1999/xhtml", "i").localName, "i"); // Sanity
  var i = document.body.append(document.createElementNS("http://www.w3.org/1999/xhtml", "I"));
  assert_equals(i.localName, "I");
  assert_equals(i.tagName, "I");
  assert_equals(document.getElementsByTagName("I").length, 0);
  assert_equals(document.getElementsByTagName("i").length, 0);
  document.body.nodes.remove(i);
}, "tag=I/i");

test(() {
  var t = document.body.append(document.createElementNS("test", "te:st"));
  assert_equals(document.getElementsByTagName("st").length, 1);
  assert_equals(document.getElementsByTagName("st")[0], t);
  assert_equals(document.getElementsByTagName("te:st").length, 0);
  document.body.nodes.remove(t);
}, "tag=st");

test(() {
  var h = document.body.append(document.createElementNS("http://www.w3.org/1999/xhtml", "te:st"));
  assert_equals(document.getElementsByTagName("st")[0], h);
  assert_equals(document.getElementsByTagName("TE:ST").length, 0);
  document.body.nodes.remove(h);
}, "tag='te:st'");

checkTestFailures();
}
