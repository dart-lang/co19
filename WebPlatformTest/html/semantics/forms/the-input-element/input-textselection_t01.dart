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
 * after web-platform-tests/html/semantics/forms/the-input-element/input-textselection-01.html
 * @assertion
 * http://www.whatwg.org/html5/#textFieldSelection
 * <link rel=help href="http://www.w3.org/html/wg/drafts/html/master/#attr-fe-autocomplete">
 * @description The selection interface members
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {

  var valid = ["text", "search", "url", "tel", "email", "password"];
  var invalid = ["hidden", "datetime", "date", "month", "week", "datetime-local",
                 "number", "range", "color", "checkbox", "radio", "button",
                 "file", "submit", "image", "reset", "button"];
  valid.forEach((aType) {
    test(() {
      var input = document.createElement("input") as InputElement;
      input.type = aType;
      assert_equals(input.type, aType, "Input type unsupported");
      input.select();
      var a = input.selectionStart;
      input.selectionStart = 0;
      a = input.selectionEnd;
      input.selectionEnd = 0;
      input.setSelectionRange(0, 0);
    }, "Selection attributes should apply to type " + aType);
  });

  invalid.forEach((aType) {
    test(() {
      var input = document.createElement("input") as InputElement;
      input.type = aType;
      assert_equals(input.type, aType, "Input type unsupported");
      assert_throws("InvalidStateError", () { input.select(); }, "Should throw with type " + aType);
      assert_throws("InvalidStateError", () { var a = input.selectionStart; });
      assert_throws("InvalidStateError", () { input.selectionStart = 0; });
      assert_throws("InvalidStateError", () { var a = input.selectionEnd; });
      assert_throws("InvalidStateError", () { input.selectionEnd = 0; });
      assert_throws("InvalidStateError", () { input.setSelectionRange(0, 0); });
    }, "Selection attributes should not apply to type " + aType);
  });

  checkTestFailures();
}
