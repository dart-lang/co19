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
      <p>Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=13690">bug 13960</a>:
      JavaScript Form Validation issue on Banco do Brasil site.</p>

      <form>
      <input type="text">
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement input = document.body.querySelector("input") as InputElement;
  input.value = "1";
  // the insertion point should be at the end
  shouldBe(input.selectionStart, 1);
  input.focus();
  input.value = "12";
  shouldBe(input.selectionStart, 2);
}
