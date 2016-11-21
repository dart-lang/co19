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

main() {
  document.body.setInnerHtml('''
      <p>This page tests that the <tt>maxlength</tt> attribute of the <tt>&lt;input&gt;</tt> element works correctly. <a href="http://bugs.webkit.org/show_bug.cgi?id=14388">http://bugs.webkit.org/show_bug.cgi?id=14388</a></p>
      <div id="console"></div>

      <input id="input">
      ''', treeSanitizer: new NullTreeSanitizer());

  StringBuffer testString = new StringBuffer();
  InputElement input = document.getElementById("input") as InputElement;

  void attempt(int length) {
    debug("Attempting to insert $length characters with maxLength = ${input.getAttribute("maxlength")}.");

    if (testString.length > length)
      testString.clear();

    for (int i = testString.length; i < length; ++i)
      testString.write(i % 10);
    input.value = testString.toString();
    shouldBe(input.value.length, length);
  }

  // Chrome limit for input values length is 512K (524288). So don't check values
  // longer than 512K
  List<int> stringLengthsToTest = [0, 5, 100, 101, 200, 524287, 524288];
  List<String> maxLengthsToTest = ["-1", "100", "524288", "600000"];

  for (int i = 0; i < stringLengthsToTest.length; ++i) {
    int stringLength = stringLengthsToTest[i];
    for (int j = 0; j < maxLengthsToTest.length; ++j) {
      String maxLength = maxLengthsToTest[j];
      input.setAttribute("maxLength", maxLength);
      attempt(stringLength);
    }
  }

  debug('Some tests for .maxLength property.');
  input = document.createElement("input");
  shouldThrow(() => input.maxLength = -100,
      (e) => e is DomException && e.name == DomException.INDEX_SIZE);
  input.maxLength = 100;
  shouldBe(input.getAttribute('maxlength'), '100');
}
