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
 * after web-platform-tests/dom/nodes/Node-parentNode.html
 *
 * @assertion Node.parentNode
 * @description
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  document.body.appendHtml("""
<iframe id=a src="data:text/html,<a name='c'>c</a>"></iframe>
"""
);

// XXX need to test for more node types
test(() {
  assert_equals(document.parentNode, null);
}, "Document");

/*
test(() {
  assert_equals(document.doctype.parentNode, document);
}, "Doctype");
*/

test(() {
  assert_equals(document.documentElement.parentNode, document);
}, "Root element");

test(() {
  var el = document.createElement("div");
  assert_equals(el.parentNode, null);
  document.body.append(el);
  assert_equals(el.parentNode, document.body);
}, "Element");

IFrameElement iframe = document.getElementById("a");
test(() {
  iframe.onLoad.drain().then((v) {
    var doc = (iframe.contentWindow as Window).document;
    iframe.parentNode.childNodes.remove(iframe);
    assert_equals(doc.firstChild.parentNode, doc);
    asyncEnd();
  },
  onError: (e) {
     throw e;
 });
}, "Removed iframe");

checkTestFailures();
}
