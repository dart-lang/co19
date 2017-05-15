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
 * after web-platform-tests/html/semantics/forms/the-input-element/input-type-checkbox.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/CR/forms.html#checkbox-state-(type=checkbox
 * @description input type checkbox
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div style="display:none;">
  <input id="checkbox_default" type="checkbox" width="20" />

  <input id="checkbox_checked" type="checkbox" checked />

  <input id="checkbox_indeterminate" type="checkbox" />

  <input id="checkbox_default_value" type="checkbox" />
</div>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

  var checkbox_default = document.getElementById('checkbox_default'),
      checkbox_checked = document.getElementById('checkbox_checked'),
      checkbox_indeterminate = document.getElementById('checkbox_indeterminate'),
      checkbox_default_value = document.getElementById('checkbox_default_value');

  test(() {
    assert_false(checkbox_default.checked);
  }, "default checkbox has no checkedness state");

  test(() {
    assert_true(checkbox_checked.checked);
  }, "checkbox with initial state set to checked has checkedness state");

  test(() {
    assert_false(checkbox_indeterminate.indeterminate);
  }, "a checkbox has an indeterminate state set to false onload");

  test(() {
    checkbox_indeterminate.indeterminate = true;
    assert_true(checkbox_indeterminate.indeterminate);
  }, "on setting, a checkbox's indeterminate state must be set to the new value and returns the last value it was set to");

  test(() {
    assert_equals(checkbox_default_value.value, 'on');
  }, "default/on: on getting, if the element has a value attribute, it must return that attribute's value; otherwise, it must return the string 'on'");

  test(() {
    checkbox_default_value.value = 'chicken';
    assert_equals(checkbox_default_value.value, 'chicken');
  }, "on getting, if the element has a value attribute, it must return that attribute's value");

  checkTestFailures();
}
