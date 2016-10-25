/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks that text-align-last parses properly the
 * properties from CSS 3 Text.
 */
import "dart:html";
import "../../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="test">hello world</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var e, defaultValue;

  testElementStyle(value)
  {
    shouldBe(e.style.textAlignLast, value);
    shouldBe(e.style.getPropertyValue("text-align-last"), value);
  }

  testComputedStyle(value)
  {
    var computedStyle = getComputedStyle(e, null);
    shouldBe(computedStyle.textAlignLast, value);
    shouldBe(computedStyle.getPropertyValue("text-align-last"), value);
  }

  valueSettingTest(value)
  {
    debug("Value '" + value + "':");
    e.style.textAlignLast = value;
    testElementStyle(value);
    testComputedStyle(value);
  }

  invalidValueSettingTest(value, defaultValue)
  {
    debug("Invalid value test - '" + value + "':");
    e.style.textAlignLast = value;
    testElementStyle(defaultValue);
    testComputedStyle(defaultValue);
  }

  e = document.getElementById('test');

  debug("Test the initial value:");
  testComputedStyle('auto');
  debug('');

  valueSettingTest('start');
  valueSettingTest('end');
  valueSettingTest('left');
  valueSettingTest('right');
  valueSettingTest('center');
  valueSettingTest('justify');
  valueSettingTest('auto');

  defaultValue = 'auto';
  e.style.textAlignLast = defaultValue;
  invalidValueSettingTest('-webkit-left', defaultValue);
  invalidValueSettingTest('-webkit-right', defaultValue);
  invalidValueSettingTest('-webkit-center', defaultValue);
  invalidValueSettingTest('-webkit-match-parent', defaultValue);
  invalidValueSettingTest('-webkit-auto', defaultValue);
}
