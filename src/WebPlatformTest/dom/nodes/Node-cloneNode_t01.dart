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
