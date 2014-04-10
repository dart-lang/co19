/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description First set attribute is returned with mapped attribute set later
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("div");
  el.setAttributeNS("xx", "align", "right");
  el.setAttributeNS("", "align", "left");
  el.setAttributeNS("xx", "foo", "right");
  el.setAttributeNS("", "foo", "left");
  assert_equals(el.getAttribute("align"), "right");
  assert_equals(el.getAttribute("foo"), "right");
  assert_equals(el.getAttributeNS("xx", "align"), "right");
  assert_equals(el.getAttributeNS(null, "foo"), "left");
  assert_equals(el.getAttributeNS("", "foo"), "left");
}
