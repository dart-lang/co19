/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks that text-justify parses properly the
 * properties from CSS 3 Text.
 */
import "dart:html";
import "../../../../testcommon.dart";
import "../../../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <div id="test"></div>
      <div id="ancestor"><div id="child"></div></div>
      <div id="console"><div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var element, ancestor, presettedValue;

  testElementStyle(value)
  {
    shouldBe(element.style.textJustify, value);
    shouldBe(element.style.getPropertyValue('text-justify'), value);
  }

  testComputedStyle(value)
  {
    var computedStyle = getComputedStyle(element, null);
    shouldBe(computedStyle.textJustify, value);
    shouldBe(computedStyle.getPropertyValue('text-justify'), value);
  }

  valueSettingTest(value)
  {
    debug("Value '" + value + "':");
    element.style.textJustify = value;
    testElementStyle(value);
    testComputedStyle(value);
    debug('');
  }

  invalidValueSettingTest(value, presettedValue)
  {
    debug("Invalid value test - '" + value + "':");
    element.style.textJustify = value;
    testElementStyle(presettedValue);
    testComputedStyle(presettedValue);
    debug('');
  }

  ownValueTest(ancestorValue, childValue)
  {
    debug("Value of ancestor is '" + ancestorValue + ", while child is '" + childValue + "':");
    ancestor.style.textJustify = ancestorValue;
    document.getElementById('child').style.textJustify = childValue;
    testElementStyle(childValue);
    testComputedStyle(childValue);
    debug('');
  }

  inheritanceTest(ancestorValue)
  {
    debug("Value of ancestor is '" + ancestorValue + "':");
    ancestor.style.textJustify = ancestorValue;
    expectedInheritedValue = ancestorValue;
    testElementStyle(expectedInheritedValue);
    testComputedStyle(expectedInheritedValue);
    debug('');
  }

  computedValueSettingTest(value, expectedComputedValue)
  {
    debug("Computed value test - '" + value + "':");
    if (value == 'inherit')
      ancestor.style.textJustify = expectedComputedValue;
    element.style.textJustify = value;
    testElementStyle(value);
    testComputedStyle(expectedComputedValue);
    debug('');
  }

  element = document.getElementById('test');

  valueSettingTest('none');
  valueSettingTest('inter-word');
  valueSettingTest('distribute');

  presettedValue = 'none';
  debug("Presetted value is none");
  element.style.textJustify = presettedValue;
  invalidValueSettingTest('green', presettedValue);
  invalidValueSettingTest('inline', presettedValue);

  presettedValue = 'distribute';
  debug("Presetted value is distribute");
  element.style.textJustify = presettedValue;
  invalidValueSettingTest('solid', presettedValue);
  invalidValueSettingTest('normal', presettedValue);

  element = document.getElementById('child');
  ancestor = document.getElementById('ancestor');

  computedValueSettingTest('inherit', 'none');
  computedValueSettingTest('inherit', 'distribute');
  computedValueSettingTest('initial', 'auto');

  ownValueTest("inter-word", "distribute");
  ownValueTest("none", "inter-word");
}
