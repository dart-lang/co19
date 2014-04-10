/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description xmlns should be allowed as local name
 * @issue 16395
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("foo");
  el.setAttributeNS("ns", "a:xmlns", "pass");
  assert_equals(el.getNamespacedAttributes("ns").length, 1, "attr count");
  Expect.mapEquals({"a:xmlns":"pass"}, el.getNamespacedAttributes("ns"), "attr values");
}