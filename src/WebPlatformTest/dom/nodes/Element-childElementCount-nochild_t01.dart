/*
 * after web-platform-tests/dom/nodes/Element-childElementCount-dynamic-remove.html
 *
 * @assertion childElementCount without Child Element Nodes
 * @description Test of childElementCount with No Child Element Nodes
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var body=document.body;
  var el=body.createFragment(""""
<p id="parentEl" style="font-weight:bold;">Test.</p>
  """);"
  body.append(el);

test(() {
  var parentEl = document.getElementById("parentEl");
  assert_equals(parentEl.children.length, 0);
}, "Test of childElementCount with No Child Element Nodes");

checkTestFailures();
}
