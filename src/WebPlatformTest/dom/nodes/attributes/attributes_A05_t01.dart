/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#attr">
 * 
 * @description First set attribute is returned by getAttribute
 * @needsreview issue #16395
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("div");
  el.setAttributeNS("ab", "attr", "t1");
  el.setAttributeNS("kl", "attr", "t2");
  assert_equals(el.getAttribute("attr"), "t1", 'getAttribute("attr")');
  assert_equals(el.getAttributeNS("ab", "attr"), "t1", 'getAttributeNS("ab", "attr")');
  assert_equals(el.getAttributeNS("kl", "attr"), "t2", 'getAttributeNS("kl", "attr")');
  assert_equals(el.getAttributeNS(null, "attr"), null, 'getAttributeNS(null, "attr")');
  assert_equals(el.getAttributeNS("", "attr"), null, 'getAttributeNS("", "attr")');
}