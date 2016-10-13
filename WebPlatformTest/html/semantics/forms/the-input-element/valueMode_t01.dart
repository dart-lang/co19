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
 * after web-platform-tests/html/semantics/forms/the-input-element/valueMode.html
 * @assertion
 * @description Input element value mode
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
''';

const String type='type';
const String sanitizedValue='sanitizedValue';
const String mode='mode';

void main() {
  document.body.appendHtml(htmlEL);

  var types = [
    { type: "hidden", mode: "default" },
    { type: "text", mode: "value", sanitizedValue: "foo" },
    { type: "search", mode: "value", sanitizedValue: "foo" },
    { type: "tel", mode: "value", sanitizedValue: "foo" },
    { type: "url", mode: "value", sanitizedValue: "foo" },
    { type: "email", mode: "value", sanitizedValue: "foo" },
    { type: "password", mode: "value", sanitizedValue: "foo" },
    { type: "datetime", mode: "value", sanitizedValue: "" },
    { type: "date", mode: "value", sanitizedValue: "" },
    { type: "month", mode: "value", sanitizedValue: "" },
    { type: "week", mode: "value", sanitizedValue: "" },
    { type: "time", mode: "value", sanitizedValue: "" },
    { type: "number", mode: "value", sanitizedValue: "" },
    { type: "range", mode: "value", sanitizedValue: "50" },
    { type: "color", mode: "value", sanitizedValue: "#000000" },
    { type: "checkbox", mode: "default/on" },
    { type: "radio", mode: "default/on" },
    { type: "submit", mode: "default" },
    { type: "image", mode: "default" },
    { type: "reset", mode: "default" },
    { type: "button", mode: "default" }
  ];
  
  for (var i = 0; i < types.length; i++) {
    test(() {
      var input = document.createElement("input") as InputElement;
      var expected;
      input.type = types[i][type];
      input.value = "foo";
      switch(types[i][mode]) {
        case "default":
          expected = "";
          break;
        case "default/on":
          expected = "on";
          break;
        case "value":
          expected = types[i][sanitizedValue];
          break;
      }
      assert_equals(input.value, expected);
    }, "value IDL attribute of input type " + types[i][type] + " without value attribute");

    test(() {
      var input = document.createElement("input") as InputElement;
      var expected;
      input.type = types[i][type];
      input.setAttribute("value", "bar");
      input.value = "foo";
      switch(types[i][mode]) {
        case "default":
          expected = "bar";
          break;
        case "default/on":
          expected = "bar";
          break;
        case "value":
          expected = types[i][sanitizedValue];
          break;
      }
      assert_equals(input.value, expected);
    }, "value IDL attribute of input type " + types[i][type] + " with value attribute");
  }

  checkTestFailures();
}
