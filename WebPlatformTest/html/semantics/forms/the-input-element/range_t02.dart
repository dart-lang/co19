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
 * after web-platform-tests/html/semantics/forms/the-input-element/range-2.html
 * @assertion
 * @description range input Tests
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<input type="range" id="r00" min="0" max="100" step="20" value="40" style="display:none">
<input type="range" id="r01" min="0" max="1" step=".1" value=".2" style="display:none">
<input type="range" id="r02" style="display:none">
<input type="range" id="r03" style="display:none">
<input type="range" id="r04" style="display:none">
''';

InputElement getInputElement(String id) => document.getElementById(id);

void main() {
  document.body.appendHtml(htmlEL);

test(() {
  getInputElement('r00').value = "";
  assert_equals(getInputElement('r00').type, "range");
  assert_equals(getInputElement('r00').value, "60");
}, "range input value set to ''");

test(() {
  getInputElement('r01').value = ".6";
  assert_equals(getInputElement('r01').type, "range");
  assert_equals(getInputElement('r01').value, "0.6");
}, "range input value set to an integer");

test(() {
  assert_equals(getInputElement('r02').type, "range");
  assert_equals(getInputElement('r02').value, "50");
}, "range input value equals 50");

test(() {
  getInputElement('r03').value = "200";
  assert_equals(getInputElement('r03').type, "range");
  assert_equals(getInputElement('r03').value, "100");
}, "range input value equals 100");

test(() {
  getInputElement('r04').value = "2.1";
  assert_equals(getInputElement('r04').type, "range");
  assert_equals(getInputElement('r04').value, "2");
}, "range input value equals 2");

  checkTestFailures();
}
