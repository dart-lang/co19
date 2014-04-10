/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattribute">
 * 
 * @description setAttribute should lowercase its name argument (upper case attribute)
 * @issue #16395 - Incorrect Element.getAttributeNS()
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("div");
  el.setAttribute("ALIGN", "left");
  assert_equals(el.getAttributeNS("", "ALIGN"), null);
  assert_equals(el.getAttributeNS("", "align"), "left");
  assert_equals(el.getAttribute("align"), "left");
}