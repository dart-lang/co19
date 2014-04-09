/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#attr">
 * 
 * @description Unset attributes return null
 * @issue #16395 - Incorrect Element.getAttributeNS()
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("div");
  assert_equals(el.getAttribute("bar"), null, "getAttribute");
  assert_equals(el.getAttributeNS(null, "bar"), null, "getAttributeNS null");
  assert_equals(el.getAttributeNS("", "bar"), null, "getAttributeNS ''");
}