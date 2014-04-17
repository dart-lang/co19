/*
 * after web-platform-tests/dom/nodes/Element-childElementCount.html
 *
 * @assertion childElementCount
 * @description Test of childElementCount
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

  var body=document.body;
  var el=body.createFragment(""""
<p id="parentEl">The result of
  <span id="first_element_child">
  <span>this</span> <span>test</span>
</span> is
<span id="middle_element_child">given above.</span>
<span id="last_element_child">fnord</span> </p>
  """);
  body.append(el);

test(() {
  var parentEl = document.getElementById("parentEl");
  assert_true(parentEl.contains("childElementCount"));
  assert_equals(parentEl.children.length, 3);
}, "childElementCount");

checkTestFailures();
}
