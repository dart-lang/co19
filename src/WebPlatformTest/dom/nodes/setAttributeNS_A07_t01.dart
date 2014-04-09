/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description The XMLNS namespace should require xmlns as prefix or qualified name
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

const XMLNS = "http://www.w3.org/2000/xmlns/";

void main() {
  var el = document.createElement("foo");
  assert_throws("NamespaceError",
                () { el.setAttributeNS(XMLNS, "a:xmlns", "fail"); });
  assert_throws("NamespaceError",
                () { el.setAttributeNS(XMLNS, "b:foo", "fail"); });
}