/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for WebKit bug 18294 : Strange Result for getComputedStyle
 * on borderWidth set in em
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>

      <div id="tests_container">

      <div id="test" style="border-style:solid;font-size:100px;"></div>

      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var test = document.getElementById("test");

  test.style.borderWidth = "120em 110em 100em 90.1em";
  var computedStyle = test.getComputedStyle();
  shouldBe(computedStyle.getPropertyValue('border-width'), '12000px 11000px 10000px 9010px');
  //shouldBe(computedStyle.getPropertyCssValue('border-top-width').cssText,'12000px');
  //shouldBe(computedStyle.getPropertyCssValue('border-right-width').cssText,'11000px');
  //shouldBe(computedStyle.getPropertyCssValue('border-bottom-width').cssText,'10000px');
  //shouldBe(computedStyle.getPropertyCssValue('border-left-width').cssText,'9010px');
}
