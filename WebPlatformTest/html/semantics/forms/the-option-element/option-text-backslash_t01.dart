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
 * after web-platform-tests/html/semantics/forms/the-option-element/option-text-backslash.html
 * @assertion
 * @description Test for the backslash sign in option.text
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String value='value';
const String expected='expected';
const String testname='testname';

const String htmlEL=r'''
<select id=test><option>\</option></select>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  var select = document.getElementById("test");
  var option = select.firstChild;
  assert_equals(option.text, "\\", "${option.text.length}");
}
