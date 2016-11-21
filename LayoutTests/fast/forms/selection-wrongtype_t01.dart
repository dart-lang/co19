/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests to ensure selectionStart, selectionEnd,
 * selectionDirection and selectionRange throw exceptions when the input
 * element is not a text field.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="tests"><input type="button"><input type="checkbox"><input type="file"><input type="hidden">
      <input type="image"><input type="radio"><input type="range"><input type="reset"><input type="submit"><input type="email"><input type="number"></div>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  _shouldThrow(func())
    => shouldThrow(func, (e) => e is DomException && e.name == DomException.INVALID_STATE);

  Element tests = document.getElementById('tests');
  for (var i = 0; i < tests.children.length; i++) {
    InputElement test = tests.children[i] as InputElement;
    test.focus();

    _shouldThrow(() => test.selectionStart);
    _shouldThrow(() => test.selectionStart = 0);
    _shouldThrow(() => test.selectionEnd);
    _shouldThrow(() => test.selectionEnd = 0);
    _shouldThrow(() => test.selectionDirection);
    _shouldThrow(() => test.selectionDirection = "0");
    //shouldThrow(() => test.selectionRange());
  }
}
