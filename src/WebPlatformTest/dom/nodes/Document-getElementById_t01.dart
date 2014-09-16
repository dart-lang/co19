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
 * after web-platform-tests/dom/nodes/Document-getElementById.html
 * <link rel=help href="http://dom.spec.whatwg.org/#dom-document-createevent">
 *
 * @assertion Document.getElementById()
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-document-getelementbyid">
 * The getElementById(elementId) method must return the first element, in tree order, 
 * within the context object's tree, whose ID is elementId, or null if there is none.
 * 
 * An element has an ID if it has an id attribute whose value is not the empty string.
 *
 * @description Document.getElementById with an empty string
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
test(() {
  var x = new Element.html('<div id=""></div>');
  document.body.append(x);
  assert_equals(document.getElementById(""), null);
  // XXX needs more tests
}, "empty string is not an ID");

checkTestFailures();
}
