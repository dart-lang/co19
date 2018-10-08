/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for https://bugs.webkit.org/show_bug.cgi?id=19085
 * Bug 19085: font-family: initial sets font-family differently than font: initial
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  document.body.setInnerHtml('''
      <div id="unstyled">Unstyled Font Family</div>
      <div id="initialFontFamily" style="font-family: initial;">Initial Font Family</div>
      <div id="initialFont" style="font: initial;">Initial Font</div>
      <hr>
      <p id="description"></p>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var initialFontElement = document.getElementById("initialFont");
  var initialFontFamilyElement = document.getElementById("initialFontFamily");
  var unstyledElement = document.getElementById("unstyled");

  var initialFont = getComputedStyle(initialFontElement, null).getPropertyValue("font-family");
  var initialFontFamily = getComputedStyle(initialFontFamilyElement, null).getPropertyValue("font-family");
  var unstyled = getComputedStyle(unstyledElement, null).getPropertyValue("font-family");

  shouldBe(initialFontFamily, unstyled);
  shouldBe(initialFont, unstyled);
}
