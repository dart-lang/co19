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
      <p>This page tests that the length of an <tt>&lt;input&gt;</tt> element's string is implicitly limited to 524288 characters. <a href="http://bugs.webkit.org/show_bug.cgi?id=14388">http://bugs.webkit.org/show_bug.cgi?id=14388</a></p>
      <input id="input">
      ''', treeSanitizer: new NullTreeSanitizer());

  StringBuffer testString = new StringBuffer();

  attempt(length, expected) {
    debug("Attempting to insert $length characters.");

    if (testString.length > length)
      testString.clear();

    for (var i = testString.length; i < length; ++i)
      testString.write(i % 10);

    var input = document.getElementById("input");
    input.value = testString.toString();

    shouldBe(input.value.length, expected);
  }

  attempt(0, 0);
  attempt(5, 5);
  attempt(1025, 1025);
  attempt(524287, 524287);
  attempt(524288, 524288);
  attempt(524289, 524288);
  attempt(530000, 524288);
}
