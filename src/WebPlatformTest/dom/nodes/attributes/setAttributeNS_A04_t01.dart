/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description A namespace is required to use a prefix.
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("foo");
  assert_throws("NamespaceError",
                () { el.setAttributeNS("", "aa:bb", "fail"); });
  assert_throws("NamespaceError",
                () { el.setAttributeNS(null, "aa:bb", "fail"); });
}