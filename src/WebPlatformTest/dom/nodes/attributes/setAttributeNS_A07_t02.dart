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
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description xmlns should be allowed as prefix in the XMLNS namespace
 * @issue #16395 - Incorrect Element.getAttributeNS()
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

const XMLNS = "http://www.w3.org/2000/xmlns/";

void main() {
  var el = document.createElement("foo");
  assert_equals(el.attributes.length, 0);
  el.setAttributeNS(XMLNS, "xmlns:a", "pass");
  var attributes=new Map.from(el. getNamespacedAttributes(XMLNS));
  print("el.attributes=${attributes}");
  assert_equals(attributes.length, 1);
  var key=attributes.keys.first;
  Expect.equals("xmlns:a", key);
  Expect.equals("pass", attributes[key]);
}
