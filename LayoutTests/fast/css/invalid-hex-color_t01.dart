/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for Bug 24742 - CSS tokenizer allows color in 6 hex digit
 * notation to be followed by the next token without separation
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      div {
          margin-bottom:11px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id='tests'>FAIL</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test() {
    var test_defs = [
      /* description, expected style, test style */
      ["Invalid: 0 hexadecimal digits", "", "border-bottom: solid #"],
      ["Invalid: 1 hexadecimal digits", "", "border-bottom: solid #1"],
      ["Invalid: 2 hexadecimal digits", "", "border-bottom: solid #11"],
      ["Valid: 3 hexadecimal digits", "border-bottom: solid rgb(17,17,17)", "border-bottom: solid #111"],
      ["Invalid: 4 hexadecimal digits", "", "border-bottom: solid #1111"],
      ["Invalid: 5 hexadecimal digits", "", "border-bottom: solid #11111"],
      ["Valid: 6 hexadecimal digits", "border-bottom: solid rgb(17,17,17)", "border-bottom: solid #111111"],
      ["Invalid: 7 hexadecimal digits", "", "border-bottom: solid #1111111"],
      ["Invalid: 0 hexadecimal digits concatenated with 'px'", "", "border-bottom: solid #px"],
      ["Invalid: 1 hexadecimal digits concatenated with 'px'", "", "border-bottom: solid #1px"],
      ["Invalid: 2 hexadecimal digits concatenated with 'px'", "", "border-bottom: solid #11px"],
      ["Invalid: 3 hexadecimal digits concatenated with 'px'", "", "border-bottom: solid #111px"],
      ["Invalid: 4 hexadecimal digits concatenated with 'px'", "", "border-bottom: solid #1111px"],
      ["Invalid: 5 hexadecimal digits concatenated with 'px'", "", "border-bottom: solid #11111px"],
      ["Invalid: 6 hexadecimal digits concatenated with 'px'", "", "border-bottom: solid #111111px"],
      ["Invalid: 7 hexadecimal digits concatenated with 'px'", "", "border-bottom: solid #1111111px"],
    ];

    var testHtml = "";
    for (var i = 0; i < test_defs.length; i++) {
      var test_def = test_defs[i];
      testHtml += "<div>Test $i  (${test_def[0]})" +
        "<span id='expected_$i' style='${test_def[1]}'> [EXPECTED] </span>" +
        "<span id='actual_$i' style='${test_def[2]}'> [ACTUAL] </span>" +
        "<span id='result_$i'></span></div>";
    }
    document.getElementById('tests').setInnerHtml(testHtml, treeSanitizer: new NullTreeSanitizer());

    for (var i = 0; i < test_defs.length; i++) {
      debug('Testing ${test_defs[i][0]}');
      var expected = document.getElementById("expected_$i").style.borderBottomColor;
      var actual = document.getElementById("actual_$i").style.borderBottomColor;
      var message;
      var color;
      if (actual == expected) {
        message = "PASS";
        color = "green";
      } else {
        message = "FAIL: expected:'" + expected + "' actual:'" + actual + "'";
        color = "red";
      }
      var result = document.getElementById("result_$i");
      result.innerHtml = message;
      result.style.color = color;
      shouldBe(actual, expected);
    }
  }

  test();
}
