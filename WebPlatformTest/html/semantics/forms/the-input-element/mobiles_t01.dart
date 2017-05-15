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
 * after web-platform-tests/html/semantics/forms/the-input-element/mobiles.html
 * @assertion
 * http://www.w3.org/TR/html5/the-input-element.html#dom-input-type
 * @description Mobile Inputs
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
        <h1>Mobile Inputs</h1>
        <div style="display: none">
            <input type="text" />
            <input type="number" />
            <input type="email" />
            <input type="tel" />
            <input type="url" />
        </div>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  var input=document.getElementsByTagName("input");
  test(() {assert_equals(input[0].type, "text");}, "text type support on input element");
  test(() {assert_equals(input[1].type, "number");}, "number type support on input element");
  test(() {assert_equals(input[2].type, "email");}, "email type support on input element");  
  test(() {assert_equals(input[3].type, "tel");}, "tel type support on input element");
  test(() {assert_equals(input[4].type, "url");}, "url type support on input element");

  checkTestFailures();
}
