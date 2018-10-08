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
 * after web-platform-tests/html/semantics/forms/the-input-element/type-change-state.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#the-input-element
 * @description Input element's type attribute changes state
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String type='type';
const String sanitizedValue='sanitizedValue';

void main() {
  var types = [
    { type: "hidden" },
    { type: "text", sanitizedValue: "  foobar  " },
    { type: "search", sanitizedValue: "  foobar  " },
    { type: "tel", sanitizedValue: "  foobar  " },
    { type: "url", sanitizedValue: "foobar" },
    { type: "email", sanitizedValue: "foobar" },
    { type: "password", sanitizedValue: "  foobar  " },
    { type: "datetime", sanitizedValue: "" },
    { type: "date", sanitizedValue: "" },
    { type: "month", sanitizedValue: "" },
    { type: "week", sanitizedValue: "" },
    { type: "time", sanitizedValue: "" },
    { type: "number", sanitizedValue: "" },
    { type: "range", sanitizedValue: "50" },
    { type: "color", sanitizedValue: "#000000" },
    { type: "checkbox" },
    { type: "radio" },
    { type: "file" },
    { type: "submit" },
    { type: "image" },
    { type: "reset" },
    { type: "button" }
  ];

  for (var i = 0; i < types.length; i++) {
    for (var j = 0; j < types.length; j++) {
      if (types[i] != types[j]) {
        test(() {
          var input = document.createElement("input") as InputElement;
          input.type = types[i][type];
          if (types[i][type] == "file") {
            assert_throws("InvalidStateError", () {
              input.value = "  foo\rbar  ";
            });
            assert_equals(input.value, "");
          } else {
            input.value = "  foo\rbar  ";
            input.type = types[j][type];  // change state
            if (types[j][sanitizedValue] != null || types[j][sanitizedValue] == "") {
              assert_equals(input.value, types[j][sanitizedValue], "input.value should be " + types[j][sanitizedValue] + " after change of state");
            } else {
              assert_equals(input.value, "  foo\rbar  ", "input.value should be '  foo\\rbar  ' after change of state");
            }
          }
        }, "change state from " + types[i][type] + " to " + types[j][type]);
      }
    }
  }

  checkTestFailures();
}
