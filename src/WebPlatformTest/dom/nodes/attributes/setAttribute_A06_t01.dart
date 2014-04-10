/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattribute">
 * 
 * @description setAttribute should set the first attribute with the given name
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  Element el = document.createElement("baz");
  el.setAttributeNS("ab", "attr", "fail");
  el.setAttributeNS("kl", "attr", "pass");
  el.setAttribute("attr", "pass");
  Expect.mapEquals({"attr":"pass"}, el. getNamespacedAttributes("ab"));
  Expect.mapEquals({"attr":"pass"}, el. getNamespacedAttributes("kl"));
}