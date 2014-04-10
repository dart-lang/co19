/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattribute">
 * 
 * @description setAttribute should set the attribute with the given qualified name
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void main() {
  // Based on a test by David Flanagan.
  var el = document.createElement("baz");
  el.setAttributeNS("foo", "foo:bar", "1");
  assert_equals(el.getAttribute("foo:bar"), "1");
  el.setAttribute("foo:bar", "2");
  assert_equals(el.getAttribute("foo:bar"), "2");
}