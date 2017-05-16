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
 * after web-platform-tests/html/semantics/forms/the-input-element/pattern_attribute.html
 * @assertion
 * http://www.w3.org/TR/html5/common-input-element-attributes.html#attr-input-pattern
 * @description Pattern Attribute
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
        <h1>Pattern Attribute</h1>
        <div style="display: none">
        <input pattern="[a-z]{3}" value="abcd" title="three letters max"/>
        </div>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  InputElement input0 = document.getElementsByTagName("input")[0];
  var pattern=input0.getAttribute("pattern");
  assert_equals(pattern, "[a-z]{3}", "pattern attribute support on input element");
}
