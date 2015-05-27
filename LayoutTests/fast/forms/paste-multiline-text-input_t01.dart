/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <h2>Test: This test verifies that text inputs will accept multiple lines of pasted text.  You should see three tests "PASS" below.</h2> 
      <input id=inputId size=60 /><br>
      ''', treeSanitizer: new NullTreeSanitizer());

  getInput() {
    return document.getElementById('inputId');
  }

  jsEscape(s) {
    // Partial
    var replacements = [
      ["\r", "\\r"],
      ["\n", "\\n"],
      ["\t", "\\t"],
      ["\f", "\\f"],
      ["\t", "\\t"],
      ["\0", "\\0"]
    ];

    for (var i = 0; i < replacements.length; ++i) {
      var r = replacements[i];
      s = s.replaceFirst(r[0], r[1]);
    }
    return s;
  }

  var DEFAULT_LINE_1 = "line\t(1 of 2)\r\nline\t(2 of 2)";
  var EXPECTED_LINE_1 = "line\t(1 of 2) line\t(2 of 2)";

  var DEFAULT_LINE_2 = "null\0char";
  var EXPECTED_LINE_2 = "null\0char";

  var DEFAULT_LINE_3 = "line with trailing newlines\r\n\r\n";
  var EXPECTED_LINE_3 = "line with trailing newlines";

  var TEST_NAME_1 = "Multi-line test";
  var TEST_NAME_2 = "Null char test";
  var TEST_NAME_3 = "Trailing newline test";

  testInputField(input_value, expected) {
    var input = getInput();
    input.focus();
    document.execCommand("SelectAll", false, null);
    document.execCommand("InsertText", false, input_value);
    var str = jsEscape(input.value);
    shouldBe(str, jsEscape(expected));
  }

  testMultiline() {
    debug(TEST_NAME_1 + ":");
    testInputField(DEFAULT_LINE_1, EXPECTED_LINE_1);

    debug(TEST_NAME_2 + ":");
    testInputField(DEFAULT_LINE_2, EXPECTED_LINE_2);

    debug(TEST_NAME_3 + ":");
    testInputField(DEFAULT_LINE_3, EXPECTED_LINE_3);
  }

  testMultiline();
}
