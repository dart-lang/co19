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
 * after web-platform-tests/html/semantics/forms/the-fieldset-element/HTMLFieldSetElement.html
 * @assertion
 *  <link rel="help" href="http://www.w3.org/TR/html51/forms.html#the-fieldset-element">
 * @description HTMLFieldSetElement interface
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<form name="fm1" style="display:none">
  <fieldset id="fs_outer">
  <legend><input type="checkbox" name="cb"></legend>
  <input type=text name="txt" id="ctl1">
  <button id="ctl2" name="btn">BUTTON</button>
    <fieldset id="fs_inner">
      <input type="text" name="txt_inner">
      <progress name="pg" value="0.5"></progress>
    </fieldset>
  </fieldset>
</form>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

var fm1,
    fs_outer,
    children_outer;

void setup() {
// was:  fm1 = document.forms.fm1;
  fm1 = document.getElementsByName("fm1").first;
  fs_outer = document.getElementById("fs_outer");
  children_outer = fs_outer.elements;
}

setup();

test( () {
  assert_equals(fs_outer.type, "fieldset", "The value of type attribute is incorrect.");
}, "The type attribute must return 'fieldset'");

test( () {
  assert_equals(fs_outer.form, fm1, "The fieldset should have a form owner.");
}, "The form attribute must return the fieldset's form owner");

test( () {
  assert_true(children_outer is HtmlCollection,
              "The elements attribute should be an HtmlCollection object, but is ${children_outer.runtimeType}");
}, "The elements must return an HtmlCollection object");

test( () {
  var fs_inner = document.getElementById("fs_inner");
  var txt_inner = document.getElementsByName("txt_inner").first;
  var cb = document.getElementsByName("cb").first;
  var txt = document.getElementsByName("txt").first;
  var btn = document.getElementsByName("btn").first;
  var children_inner = fs_inner.elements;
  assert_array_equals(children_inner, [txt_inner],
                      "The items in the collection must be children of the inner fieldset element.");
  assert_array_equals(children_outer, [cb, txt, btn, fs_inner, txt_inner],
                      "The items in the collection must be children of the outer fieldset element.");
}, "The controls must root at the fieldset element");

  checkTestFailures();
}
