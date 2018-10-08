/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks if setCustomValidity causes CSS to get applied
 * correctly.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var f = new DocumentFragment.html('''
      <style>

      [name=victim] {
        background-color: #0f0;
      }

      [name=victim]:invalid {
        background-color: #f00;
      }

      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <select name="victim"></select>
      <textarea name="victim"></textarea>
      <input name="victim">

      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByName('victim');
  var test;

  for (var i = 0; i < v.length; i++) {
    test = v[i];

    shouldBeFalse(test.validity.customError);
    shouldBeEqualToString(test.validationMessage, '');
    shouldBeEqualToString(getComputedStyle(test).backgroundColor, 'rgb(0, 255, 0)');

    var message = 'Custom validation message';
    test.setCustomValidity(message);
    shouldBeTrue(test.validity.customError);
    shouldBeEqualToString(test.validationMessage, message);
    shouldBeEqualToString(getComputedStyle(test).backgroundColor, 'rgb(255, 0, 0)');

    test.setCustomValidity('');
    shouldBeFalse(test.validity.customError);
    shouldBeEqualToString(test.validationMessage, '');
    shouldBeEqualToString(getComputedStyle(test).backgroundColor, 'rgb(0, 255, 0)');
  }
}
