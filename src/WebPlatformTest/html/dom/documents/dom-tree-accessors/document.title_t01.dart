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
/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.title-01.html
 * @assertion http://www.whatwg.org/html5/#document.title
 * @description document.title with head blown away
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {

test(() {
  var head = document.getElementsByTagName("head")[0];
  assert_true(!!head, "Head gone?!");
  head.remove();
  assert_false(!!document.getElementsByTagName("head")[0], "Head still there?!");
  document.title = "FAIL";
  assert_equals(document.title, "");
}, "t1");

test(() {
  var title2 = document.createElement("title");
  title2.append(document.createTextNode("PASS"));
  document.body.append(title2);
  assert_equals(document.title, "PASS");
}, "t2");

test(() {
  var title3 = document.createElement("title");
  title3.append(document.createTextNode("PASS2"));
  document.documentElement.insertBefore(title3, document.body);
  assert_equals(document.title, "PASS2");
}, "t3");

checkTestFailures();
}
