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
 * after web-platform-tests/html/semantics/forms/the-input-element/required_attribute.html
 * @assertion
 * http://www.w3.org/TR/html5/common-input-element-attributes.html#attr-input-required
 * @description Required Attribute
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
        <h1>Required Attribute</h1>
        <div style="display: none">
        <input type="text" required="required" />
        </div>
''';

void main() {
  document.body.appendHtml(htmlEL);
  InputElement input0=document.getElementsByTagName("input")[0];
  assert_equals(input0.getAttribute("required"), "required", "required attribute support on input element");
}
