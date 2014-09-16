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
 * after web-platform-tests/dom/ranges/Range-attributes.html
 *
 * @assertion Range attributes
 * @description
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var r = new Range();
  assert_equals(r.startContainer, document);
  assert_equals(r.endContainer, document);
  assert_equals(r.startOffset, 0);
  assert_equals(r.endOffset, 0);
  assert_true(r.collapsed);
}
