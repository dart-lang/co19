/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description setAttribute should not throw even if a load is not allowed
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("iframe");
  el.setAttribute("src", "file:///home");
  assert_equals(el.getAttribute("src"), "file:///home");
}