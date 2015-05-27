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
import "pwd.dart";

main() {
  test(value, expectedCSSText, expectedComputedCSSText)
  {
    var element = document.createElement("div");
    element.style.setProperty("font-variant-ligatures", value);
    var cssText = element.style.fontVariantLigatures;
    document.body.append(element);
    var computedCSSText = getComputedStyle(element).fontVariantLigatures;
    element.remove();
    debug('setting "$value", testing cssText');
    shouldBe(cssText, expectedCSSText);
    debug('setting "$value", testing computedCSSText');
    shouldBe(computedCSSText, expectedComputedCSSText);
  }

  test('initial', 'initial', 'normal');
  test('inherit', 'inherit', 'normal');
  test('normal', 'normal', 'normal');
  test('large', '', 'normal');
  test('25px', '', 'normal');
  test('normal normal', '', 'normal');
  test('normal no-common-ligatures', '', 'normal');

  test('no-common-ligatures', 'no-common-ligatures', 'no-common-ligatures');
  test('common-ligatures', 'common-ligatures', 'common-ligatures');
  test('no-discretionary-ligatures', 'no-discretionary-ligatures', 'no-discretionary-ligatures');
  test('discretionary-ligatures', 'discretionary-ligatures', 'discretionary-ligatures');
  test('no-historical-ligatures', 'no-historical-ligatures', 'no-historical-ligatures');
  test('historical-ligatures', 'historical-ligatures', 'historical-ligatures');

  test('no-common-ligatures no-common-ligatures', '', 'normal');
  test('common-ligatures no-discretionary-ligatures', 'common-ligatures no-discretionary-ligatures', 'common-ligatures no-discretionary-ligatures');
  test('common-ligatures no-discretionary-ligatures historical-ligatures', 'common-ligatures no-discretionary-ligatures historical-ligatures', 'common-ligatures no-discretionary-ligatures historical-ligatures');
  test('common-ligatures no-discretionary-ligatures normal', '', 'normal');
}
