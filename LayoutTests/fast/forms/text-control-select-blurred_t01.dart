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
      <div>Tests that setting selectionEnd on a blurred text control does not clobber selectionStart.</div>
      <textarea>This is dummy text. This is dummy text.</textarea>
      <input value="This is dummy text. This is dummy text">
      ''', treeSanitizer: new NullTreeSanitizer());

  _assert(property, actual, expected) {
    debug(property);
    shouldBe(actual, expected);
  }

  runTest(editArea) {
    editArea.selectionStart = 10;
    editArea.blur();
    _assert("selectionStart", editArea.selectionStart, 10);
    editArea.selectionEnd = 20;
    _assert("selectionStart", editArea.selectionStart, 10);
    _assert("selectionEnd", editArea.selectionEnd, 20);
  }

  runTest(document.querySelector('textarea'));
  runTest(document.querySelector('input'));
}
