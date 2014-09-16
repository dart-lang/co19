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
 * after web-platform-tests/html/semantics/forms/the-input-element/input-type-button.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/CR/forms.html#button-state-(type=button)
 * @description input type button
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="hide" style="display">
  <input type="button"/>
  <input type="button" value="BUTTON"/>
  <form action="/" method="get" onsubmit="isSubmitted = true;return false;">
    <input type="button" value="mutable"/>
  </form>
  <form action="/" method="get" onsubmit="isSubmitted = true;return false;">
    <input type="button" value="immutable" disabled/>
  </form>
</div>
''';

void main() {
  document.body.appendHtml(htmlEL);
var isSubmitted = false;
var buttons = document.getElementsByTagName("input");

test(() {
  assert_equals(buttons[0].value, "", "It must be the empty string");
},"empty value attribute");

test(() {
  document.getElementById("hide").style.display = "block";
  assert_not_equals(buttons[0].offsetWidth, buttons[1].offsetWidth, "If the element has a value attribute, the button's label must be the value of that attribute");
  document.getElementById("hide").style.display = "none";
},"label value");

test(() {
  isSubmitted = false;
  buttons[2].click();
  assert_equals(isSubmitted, false, "If the element is mutable, the element's activation behavior is to do nothing.");
},"mutable element's activation behavior is to do nothing.");

test(() {
  isSubmitted = false;
  buttons[3].click();
  assert_equals(isSubmitted, false, "If the element is immutable, the element has no activation behavior.");
},"immutable element has no activation behavior.");

  checkTestFailures();
}
