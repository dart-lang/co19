/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description Only lowercase attributes are returned on HTML elements (mixed case attribute)
 * @issue #16395
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("div");
  el.setAttributeNS("", "CHEEseCaKe", "tasty");
  assert_equals(el.getAttributeNS(null, "CHEESECAKE"), null);
  assert_equals(el.getAttributeNS("", "CHEESECAKE"), null);
  assert_equals(el.getAttributeNS(null, "CHEEseCaKe"), "tasty", 'getAttributeNS(null, "CHEEseCaKe")');
  assert_equals(el.getAttributeNS("", "CHEEseCaKe"), "tasty", 'getAttributeNS("", "CHEEseCaKe")');
  assert_equals(el.getAttributeNS(null, "cheesecake"), null);
  assert_equals(el.getAttributeNS("", "cheesecake"), null);
}