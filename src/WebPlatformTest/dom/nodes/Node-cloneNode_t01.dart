/*
 * after web-platform-tests/dom/nodes/Node-cloneNode.html
 *
 * @assertion Node.clone
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-node-clone">
 * @description
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("foo");
  el.append(document.createElement("bar"));
  el.setAttribute("a", "b");
  el.setAttribute("c", "d");
  var c = el.clone(false);
  assert_true(c.attributes != el.attributes);
  assert_false(identical(c.attributes, el.attributes));
  assert_equals(c.attributes.length, el.attributes.length);
  Expect.mapEquals(el.attributes, c.attributes);
  
  assert_equals(c.childNodes.length, 0);
}