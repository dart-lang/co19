/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import 'dart:math' as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p>This page tests that the <tt>maxlength</tt> attribute of the <tt>&lt;input&gt;</tt> element works correctly. <a href="http://bugs.webkit.org/show_bug.cgi?id=14388">http://bugs.webkit.org/show_bug.cgi?id=14388</a></p>
      <div id="console"></div>

      <input id="input">
      ''', treeSanitizer: new NullTreeSanitizer());

  var implicitMaxLength = 524288;
  StringBuffer testString = new StringBuffer();
  var input = document.getElementById("input");

  attempt(length, expected) {
    debug("Attempting to insert $length characters with maxLength = ${input.getAttribute("maxlength")}.");

    if (testString.length > length)
      testString.clear();

    for (var i = testString.length; i < length; ++i)
      testString.write(i % 10);

    input.value = testString.toString();
    shouldBe(input.value.length, expected);
  }

  var stringLengthsToTest = [0, 5, 100, 101, 200, 524287, 524288, 524289, 530000];
  var maxLengthsToTest = ["-1", "100", "524288", "600000"];

  for (var i = 0; i < stringLengthsToTest.length; ++i) {
    var stringLength = stringLengthsToTest[i];
    for (var j = 0; j < maxLengthsToTest.length; ++j) {
      var maxLength = maxLengthsToTest[j];
      input.setAttribute("maxlength", maxLength);
      var expected = Math.min(stringLength, implicitMaxLength);
      attempt(stringLength, expected);
    }
  }

  debug('Some tests for .maxLength property.');
  input = document.createElement("input");
  shouldBe(input.maxLength, implicitMaxLength);
  shouldThrow(() => input.maxLength = -1,
      (e) => e is DomException && e.name == DomException.INDEX_SIZE);
  input.maxLength = 100;
  shouldBe(input.getAttribute('maxlength'), '100');
}
