/*
 * after web-platform-tests/dom/nodes/Element-childElementCount-dynamic-add.html
 *
 * @assertion Element.childElementCount
 * @description Test of Dynamic Adding of Elements
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

test(() {
  var body=document.body;
  var el=body.createFragment(""""
<p id="parentEl">The result of this test is
<span id="first_element_child">logged above.</span></p>
  """);
  body.append(el);
  var parentEl = document.getElementById("parentEl");
  var newChild = document.createElement("span");
  parentEl.append(newChild);
  assert_equals(parentEl.children.length, 2);
}, "Test of Dynamic Adding of Elements");

checkTestFailures();
}
