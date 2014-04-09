/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#attr">
 * 
 * @description Specified attributes should be accessible
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var el = new Element.html('<span id="test1"></span>');
  Expect.equals(el.attributes["id"], "test1");
}