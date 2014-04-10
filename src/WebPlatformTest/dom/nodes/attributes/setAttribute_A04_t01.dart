/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattribute">
 * 
 * @description Basic functionality should be intact
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";
import "productions.dart";

void main() {
  var el = document.createElement("foo");
  for (var i = 0; i < valid_names.length; i++) {
    el.setAttribute(valid_names[i], "test");
    assert_equals(el.getAttribute(valid_names[i]), "test");
  }
}