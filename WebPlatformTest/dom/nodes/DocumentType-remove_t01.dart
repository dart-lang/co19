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
 * after web-platform-tests/dom/nodes/DocumentType-remove.html
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-childnode-remove">
 *
 * @assertion DocumentType.remove()
 *
 * @description 
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";
import "ChildNodeRemove.dart";

void main() {

test(() {
  var node = document.implementation.createDocumentType("html", "", "");
  var parent = document.implementation.createDocument(null, "", null);
  testRemove(node, parent, "doctype");
}, "testRemove");

checkTestFailures();
}
