/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description xmlns should be allowed as qualified name in the XMLNS namespace
 * @issue #16395 - Incorrect Element.getAttributeNS()
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

const XMLNS = "http://www.w3.org/2000/xmlns/";

void main() {
  var el = document.createElement("foo");
  el.setAttributeNS(XMLNS, "xmlns", "pass");
  assert_equals(el. getNamespacedAttributes(XMLNS).length, 1);
  Expect.equals("pass", el.getAttributeNS(XMLNS, "xmlns:xmlns"));
}