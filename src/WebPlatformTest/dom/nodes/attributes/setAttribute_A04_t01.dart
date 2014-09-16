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
