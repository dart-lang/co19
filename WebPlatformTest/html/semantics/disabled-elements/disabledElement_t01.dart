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
 * after web-platform-tests/html/semantics/disabled-elements/disabledElement.html
 * @assertion http://www.whatwg.org/html/#disabled-elements
 * @description Disabled elements
 */
import 'dart:html';
import "../../../Utils/expectWeb.dart";

const String htmlEL='''
<button disabled>button</button>
<input disabled>
<select disabled>
 <optgroup label="options" disabled>
  <option value="option1" disabled>option1
  <option value="option2">option2
</select>
<textarea disabled>textarea</textarea>
<fieldset disabled>
 <input type=radio name=c value=0 checked>
 <input type=radio name=c value=1>
</fieldset>
<a href="http://www.w3.org/" disabled>w3</a>
<span tabindex=0 disabled>foobar</span>
''';
         
void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

  test((){
    assert_equals(document.activeElement, document.body);
  }, "The body element must be the active element if no element is focused");

  for (var el in ["button", "input", "select", "optgroup", "option", "textarea", "input[type=radio]"]) {
    void t1() {
      var element = document.querySelector(el);
      element.focus();
      assert_equals(document.activeElement, document.body, "activeElement after focus on a disabled <" + el + "> remains unchanged");
    }

    test(t1, "A disabled <" + el + "> should not be focusable");
  };

  for (var el in ["a", "span"]) {
    test(() {
      var element = document.querySelector(el);
      element.focus();
      assert_equals(document.activeElement, element, "focus on a <" + el + "> with a disabled attribute should make it the activeElement");
    }, "A disabled <" + el + "> should be focusable");
  };
  
  checkTestFailures();
}
