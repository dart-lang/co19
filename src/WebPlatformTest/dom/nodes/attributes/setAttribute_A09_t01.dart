/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description Attributes should work in document fragments
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var docFragment = document.createDocumentFragment();
  var newOne = document.createElement("newElement");
  newOne.setAttribute("newdomestic", "Yes");
  docFragment.append(newOne);
  var domesticNode = docFragment.firstChild;
  assert_equals(domesticNode.getAttribute("newdomestic"), "Yes");
}