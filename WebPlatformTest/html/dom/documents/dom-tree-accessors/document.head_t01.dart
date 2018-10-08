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
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.head-01.html
 * @assertion http://www.whatwg.org/html5/#dom-document-head
 * @description document.head
 * the referenced spec does not allow to assign the head property
 * changed the test to check for exception 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
  var head = document.getElementsByTagName("head")[0];
  assert_equals(document.head, head);
  document.documentElement.append(document.createElement("head"));
  assert_equals(document.head, head);
  var head2 = document.createElement("head");
  document.documentElement.insertBefore(head2, head);
  assert_equals(document.head, head2);
}
