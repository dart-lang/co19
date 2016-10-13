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
 * after web-platform-tests/dom/nodes/Node-contains.html
 *
 * @assertion Node.contains
 * @description
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

  Element div = new Element.html("""
<div id="test">
  <input type="button" id="testbutton"/>
  <a id="link">Link text</a>
</div>
"""
);
  document.body.append(div);

test(() {
  assert_equals(document.contains(null), false, "Document shouldn't contain null.");
}, "contains(null) should be false");

test(() {
  assert_equals(document.contains(document), true, "Document should contain itself!");
  assert_equals(document.contains(document.createElement("foo")), false,
      "Document shouldn't contain element which is't in the document");
}, "document.contains");

test(() {
  var tb = document.getElementById("testbutton");
  assert_equals(tb.contains(tb), true, "Element should contain itself.");
  assert_equals(document.contains(tb), true, "Document should contain element in it!");
  assert_equals(document.documentElement.contains(tb), true, "Element should contain element in it!");
}, "contains with a button");

test(() {
  var link = document.getElementById("link");
  var text = link.firstChild;
  assert_equals(document.contains(text), true, "Document should contain a text node in it.");
  assert_equals(link.contains(text), true, "Element should contain a text node in it.");
  assert_equals(text.contains(text), true, "Text node should contain itself.");
  assert_equals(text.contains(link), false, "text node shouldn't contain its parent.");
}, "contains with a text node");

  test(() {
  var d = document.implementation.createHtmlDocument("");
  assert_equals(document.contains(d), false,
     "Document shouldn't contain another document.");
  assert_equals(document.contains(d.createElement("div")), false,
     "Document shouldn't contain an element from another document.");
  assert_equals(document.contains(d.documentElement), false,
     "Document shouldn't contain an element from another document.");
}, "contaibs with another document");

checkTestFailures();
}
