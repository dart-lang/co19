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
      <p>This test checks if a call to focus on an already-focused element causes a change in selection.</p>
      <hr>
      <p id="console"></p>
      <hr>
      <form>
          <p><textarea id="textarea" cols="20"></textarea></p>
          <p><input type="text" id="input" size="20"></p>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  testElement(element) {
    element.focus();
    element.value = "This is a test value.";
    element.setSelectionRange(3,7);
    element.focus();
    shouldBe(element.selectionStart, 3);
    element.blur();
  }

  test() {
    testElement(document.getElementById("textarea"));
    testElement(document.getElementById("input"));
  }

  test();
}
