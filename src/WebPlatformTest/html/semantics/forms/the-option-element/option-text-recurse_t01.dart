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
 * after web-platform-tests/html/semantics/forms/the-option-element/option-text-recurse.html
 * @assertion
 * http://www.whatwg.org/html/#dom-option-text
 * @description HTMLOptionElement
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {

test(() {
  var option = document.createElement("option");
  option.append(document.createElement("font"))
        .append(new Text(" font "));
  assert_equals(option.text, "font");
}, "option.text should recurse");

test(() {
  var option = document.createElement("option");
  option.append(new Text(" before "));
  option.append(document.createElement("script"))
        .append(new Text(" script "));
  option.append(new Text(" after "));
  assert_equals(option.text, "before after");
}, "option.text should not recurse into HTML script elements");

test(() {
  var option = document.createElement("option");
  option.append(new Text(" before "));
  option.append(document.createElementNS("http://www.w3.org/2000/svg", "script"))
        .append(new Text(" script "));
  option.append(new Text(" after "));
  assert_equals(option.text, "before after");
}, "option.text should not recurse into SVG script elements");

test(() {
  var option = document.createElement("option");
  option.append(new Text(" before "));
  option.append(document.createElementNS("http://www.w3.org/1998/Math/MathML", "script"))
        .append(new Text(" script "));
  option.append(new Text(" after "));
  assert_equals(option.text, "before script after");
}, "option.text should recurse into MathML script elements");

test(() {
  var option = document.createElement("option");
  var span = option.append(document.createElement("span"));
  span.append(new Text(" Some "));
  span.append(document.createElement("script"))
      .append(new Text(" script "));
  option.append(new Text(" Text "));
  assert_equals(option.text, "Some Text");
}, "option.text should work if a child of the option ends with a script");

test(() {
  var script = document.createElement("script");
  var option = script.append(document.createElement("option"));
  option.append(new Text("text"));
  assert_equals(option.text, "text");
}, "option.text should work if the option is in an HTML script element");

test(() {
  var script = document.createElementNS("http://www.w3.org/2000/svg", "script");
  var option = script.append(document.createElement("option"));
  option.append(new Text("text"));
  assert_equals(option.text, "text");
}, "option.text should work if the option is in an SVG script element");

test(() {
  var script = document.createElementNS("http://www.w3.org/1998/Math/MathML", "script");
  var option = script.append(document.createElement("option"));
  option.append(new Text("text"));
  assert_equals(option.text, "text");
}, "option.text should work if the option is in a MathML script element");

  checkTestFailures();
}
