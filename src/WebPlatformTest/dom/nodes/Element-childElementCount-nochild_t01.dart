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
