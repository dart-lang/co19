/*
 * after web-platform-tests/dom/nodes/Element-childElementCount-dynamic-remove.html
 *
 * @assertion Dynamic Removal of Elements
 * @description Test of Dynamic Removal of Elements
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var body=document.body;
  var el=body.createFragment(""""
<p id="parentEl">The result of this test is
<span id="first_element_child">unknown.</span>
<span id="last_element_child"> </span></p>
  """);
  body.append(el);

test(() {
  var parentEl = document.getElementById("parentEl");
  var lec = parentEl.lastChild;
  parentEl.nodes.remove(lec);
  assert_equals(parentEl.children.length, 1);
}, "Dynamic Removal of Elements");

checkTestFailures();
}
