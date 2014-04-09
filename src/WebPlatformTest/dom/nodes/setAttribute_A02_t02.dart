/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattribute">
 * @description setAttribute should lowercase its name argument (mixed case attribute)
 * @needsreview issue #16395
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("div");
  el.setAttribute("CHEEseCaKe", "tasty");
  assert_equals(el.getAttributeNS("", "CHEEseCaKe"), null);
  assert_equals(el.getAttributeNS("", "cheesecake"), "tasty");
  assert_equals(el.getAttribute("cheesecake"), "tasty");
}