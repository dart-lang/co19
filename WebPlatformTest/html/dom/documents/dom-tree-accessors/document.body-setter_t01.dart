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
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.body-setter-01.html
 * @assertion Setting document.body to incorrect values
 * @description 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {

var originalBody = document.body;

test(() {
  assert_throws("HierarchyRequestError", () {
    document.body = document.createElement("div");
  });
}, "Should throw a HierarchyRequestError when trying to set document.body to a div element.");

test(() {
  var doc = document.implementation.createHtmlDocument("");
  doc.documentElement.remove();
  assert_throws("HierarchyRequestError", () {
    doc.body = document.createElement("body");
  });
}, "Should throw a HierarchyRequestError when trying to set document.body when there's no root element.");

test(() {
  assert_equals(document.body, originalBody);
}, "document.body has not changed");

checkTestFailures();
}
