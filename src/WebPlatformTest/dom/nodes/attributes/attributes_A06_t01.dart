/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#attr">
 * 
 * @description Style attributes are not normalized
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("div");
  el.setAttribute("style", "color:#fff;");
  assert_equals(el.getAttribute("style"), "color:#fff;");
  assert_equals(el.getAttributeNS(null, "style"), "color:#fff;");
  assert_equals(el.getAttributeNS("", "style"), "color:#fff;");
}