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
 * after web-platform-tests/html/semantics/grouping-content/the-ol-element/ol.start-reflection-1.html
 * @assertion
 * http://www.w3.org/TR/html5/grouping-content.html#the-ol-element
 * @description ol.start - reflection test
 * This test checks that the start IDL attribute reflects the respective content attribute of the same name.
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
  <ol id="ol">
   <li>One</li>
   <li>Two</li>
   <li>Three</li>
  </ol>
''';

void main() {
  document.body.appendHtml(htmlEL);
  OListElement ol=document.getElementById("ol");
  assert_equals(ol.start, 1);
}
