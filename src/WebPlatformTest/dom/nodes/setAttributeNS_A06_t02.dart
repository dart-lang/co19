/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description The xmlns qualified name should not be allowed for arbitrary namespaces
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("foo");
  assert_throws("NamespaceError",
                () { el.setAttributeNS("a", "xmlns", "fail"); });
}