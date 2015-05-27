/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
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
