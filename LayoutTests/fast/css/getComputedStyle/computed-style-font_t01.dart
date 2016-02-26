/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test exercises the 'font' shorthand property in CSS
 * computed styles.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var testDiv = document.createElement('div');
  document.body.append(testDiv);

  computedFont(fontString) {
    testDiv.style.font = 'bold 600px serif';
    testDiv.style.font = fontString;
    return getComputedStyle(testDiv).getPropertyValue('font');
  }

  computedFontCSSValue(fontString) {
    testDiv.style.font = 'bold 600px serif';
    testDiv.style.font = fontString;
    var cssValue = getComputedStyle(testDiv).getPropertyValue('font');
    return cssValue;
  }

  shouldBeLikeString(computedFont('10px sans-serif'), 'normal normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('10px sans-serif'), 'normal normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('10px SANS-SERIF'), 'normal normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('12px sans-serif'), 'normal normal normal normal 12px/normal sans-serif');
  shouldBeLikeString(computedFont('12px  sans-serif'), 'normal normal normal normal 12px/normal sans-serif');
  shouldBeLikeString(computedFont('10px sans-serif, sans-serif'), 'normal normal normal normal 10px/normal sans-serif, sans-serif');
  shouldBeLikeString(computedFont('10px sans-serif, serif'), 'normal normal normal normal 10px/normal sans-serif, serif');
  shouldBeLikeString(computedFont('12px ahem'), 'normal normal normal normal 12px/normal ahem');
  shouldBeLikeString(computedFont('12px unlikely-font-name'), 'normal normal normal normal 12px/normal unlikely-font-name');
  shouldBeLikeString(computedFont('100 10px sans-serif'), 'normal normal 100 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('200 10px sans-serif'), 'normal normal 200 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('300 10px sans-serif'), 'normal normal 300 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('400 10px sans-serif'), 'normal normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('normal 10px sans-serif'), 'normal normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('500 10px sans-serif'), 'normal normal 500 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('600 10px sans-serif'), 'normal normal 600 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('700 10px sans-serif'), 'normal normal bold normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('bold 10px sans-serif'), 'normal normal bold normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('800 10px sans-serif'), 'normal normal 800 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('900 10px sans-serif'), 'normal normal 900 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('italic 10px sans-serif'), 'italic normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('small-caps 10px sans-serif'), 'normal small-caps normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('italic small-caps 10px sans-serif'), 'italic small-caps normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('italic small-caps bold 10px sans-serif'), 'italic small-caps bold normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('10px/100% sans-serif'), 'normal normal normal normal 10px/10px sans-serif');
  shouldBeLikeString(computedFont('10px/100px sans-serif'), 'normal normal normal normal 10px/100px sans-serif');
  shouldBeLikeString(computedFont('10px/normal sans-serif'), 'normal normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFont('10px/normal sans-serif'), 'normal normal normal normal 10px/normal sans-serif');

  shouldBeLikeString(computedFontCSSValue('10px sans-serif'), 'normal normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('10px sans-serif'), 'normal normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('10px SANS-SERIF'), 'normal normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('12px sans-serif'), 'normal normal normal normal 12px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('12px  sans-serif'), 'normal normal normal normal 12px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('10px sans-serif, sans-serif'), 'normal normal normal normal 10px/normal sans-serif, sans-serif');
  shouldBeLikeString(computedFontCSSValue('10px sans-serif, serif'), 'normal normal normal normal 10px/normal sans-serif, serif');
  shouldBeLikeString(computedFontCSSValue('12px ahem'), 'normal normal normal normal 12px/normal ahem');
  shouldBeLikeString(computedFontCSSValue('12px unlikely-font-name'), 'normal normal normal normal 12px/normal unlikely-font-name');
  shouldBeLikeString(computedFontCSSValue('100 10px sans-serif'), 'normal normal 100 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('200 10px sans-serif'), 'normal normal 200 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('300 10px sans-serif'), 'normal normal 300 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('400 10px sans-serif'), 'normal normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('normal 10px sans-serif'), 'normal normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('500 10px sans-serif'), 'normal normal 500 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('600 10px sans-serif'), 'normal normal 600 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('700 10px sans-serif'), 'normal normal bold normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('bold 10px sans-serif'), 'normal normal bold normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('800 10px sans-serif'), 'normal normal 800 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('900 10px sans-serif'), 'normal normal 900 normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('italic 10px sans-serif'), 'italic normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('small-caps 10px sans-serif'), 'normal small-caps normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('italic small-caps 10px sans-serif'), 'italic small-caps normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('italic small-caps bold 10px sans-serif'), 'italic small-caps bold normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('10px/100% sans-serif'), 'normal normal normal normal 10px/10px sans-serif');
  shouldBeLikeString(computedFontCSSValue('10px/100px sans-serif'), 'normal normal normal normal 10px/100px sans-serif');
  shouldBeLikeString(computedFontCSSValue('10px/normal sans-serif'), 'normal normal normal normal 10px/normal sans-serif');
  shouldBeLikeString(computedFontCSSValue('10px/normal sans-serif'), 'normal normal normal normal 10px/normal sans-serif');
}

