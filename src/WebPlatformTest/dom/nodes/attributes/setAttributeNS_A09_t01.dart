/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description Only lowercase attributes are returned on HTML elements (upper case attribute)
 * @issue #16395
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("div");
  el.setAttributeNS("", "ALIGN", "left");
  assert_equals(el.getAttributeNS(null, "ALIGN"), "left");
  assert_equals(el.getAttributeNS("", "ALIGN"), "left");
  assert_equals(el.getAttributeNS(null, "align"), null);
  assert_equals(el.getAttributeNS("", "align"), null);
}