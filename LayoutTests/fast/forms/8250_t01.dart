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
      <p>This is a test for <a href="https://bugs.webkit.org/show_bug.cgi?id=8250">bug 8250</a>.
      The 'before text inserted' event handler wasn't being told about 'interchange newlines'.
      The text field should have a space in it, followed by the word 'foo'.</p>

      <p id="test result">TEST DID NOT RUN</p>

      <input id="test" type="text">
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement e = document.getElementById("test") as InputElement;
  e.focus();
  e.setSelectionRange(0, 0);

  document.execCommand("InsertHTML", false, "<br class='Apple-interchange-newline'>foo");
  shouldBe(e.value, " foo");
}
