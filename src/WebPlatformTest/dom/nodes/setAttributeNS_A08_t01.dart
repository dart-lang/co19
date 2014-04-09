/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description Setting the same attribute with another prefix should not change the prefix
 * @issue #16395 - Incorrect Element.getAttributeNS()
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("foo");
  el.setAttributeNS("a", "foo:bar", "X");
  document.body.append(el);
  
  Expect.equals(1, el.getNamespacedAttributes("a").length, "length 1");
  Expect.equals("X", el.getAttributeNS("a", "foo:bar"));

  el.setAttributeNS("a", "quux:bar", "Y");
  Expect.equals(1, el.getNamespacedAttributes("a").length, "length 2");
  Expect.equals("Y", el.getAttributeNS("a", "foo:bar"));
}