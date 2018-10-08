/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Setting value onBlur, should not keep element in focus.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  DocumentFragment f = new DocumentFragment.html('''
      <style>
      input:focus {
          background: blue;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <input id="test" type="date">
      <a></a>
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement testInput = document.getElementById('test') as InputElement;
  testInput.addEventListener('blur', (_) {
    testInput.value = '';
  });

  testInput.value = '2012-02-01';
  testInput.focus();
  var style = getComputedStyle(testInput);
  shouldBeEqualToString(style.getPropertyValue("background-color"), 'rgb(0, 0, 255)');
  testInput.blur();
  style = getComputedStyle(testInput);
  shouldBeEqualToString(style.getPropertyValue("background-color"), 'rgb(255, 255, 255)');
}
