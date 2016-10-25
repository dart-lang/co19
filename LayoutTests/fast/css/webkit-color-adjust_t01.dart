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
  document.body.setAttribute("style", "white-space: pre-wrap;");

  document.body.setInnerHtml('''
      <div id="economy" style="-webkit-print-color-adjust:economy;"></div>
      <div id="exact" style="-webkit-print-color-adjust:exact;"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test(id, expected) {
    //var adjust = getComputedStyle(document.getElementById(id)).webkitPrintColorAdjust;
    var adjust = getComputedStyle(document.getElementById(id)).getPropertyValue("-webkit-print-color-adjust");
    shouldBe(adjust, expected);
  }

  runTests() {
    test("economy", "economy");
    test("exact", "exact");
  }

  runTests();
}
