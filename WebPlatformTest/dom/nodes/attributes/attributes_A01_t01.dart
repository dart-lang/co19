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
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#attr">
 * 
 * @description (was:AttrExodus) This test has no sense for Dart, as attribute is not an object, but
 * a key-value pair.
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void main() {
  document.body.setAttribute("abc", "pass");
  var attrs = document.body.attributes;
  Expect.equals(1, attrs.length);
  var attrKey = attrs.keys.elementAt(0);
  var attrValue = attrs[attrKey];
  Expect.equals("abc", attrKey);
  Expect.equals("pass", attrValue);
}
