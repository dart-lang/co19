/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description null and the empty string should result in a null namespace.
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("foo");
  el.setAttributeNS(null, "aa", "bb");
  el.setAttributeNS("", "xx", "bb");
  Expect.mapEquals({"aa":"bb", "xx":"bb"}, el. attributes);
}