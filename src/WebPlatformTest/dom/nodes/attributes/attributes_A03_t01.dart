/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#attr">
 * 
 * @description Entities in attributes should have been expanded while parsing
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void main() {
  Element el=new Element.html('<span class="&amp;&lt;&gt;foo"></span>');
  Expect.equals(el.attributes["class"], "&<>foo");
}