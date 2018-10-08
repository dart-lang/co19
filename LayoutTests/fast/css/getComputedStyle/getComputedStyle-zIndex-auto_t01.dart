/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div style="z-index:20" id='nonPositionedDiv'></div>
      <div style="z-index:20; position: absolute" id='positionedDiv'></div>
      <pre id='console'></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  test() {
    var element = document.getElementById('nonPositionedDiv');
    var compStyle = getComputedStyle(element, null);
    debug("Non-positioned Div:");
    shouldBe(compStyle.zIndex, 'auto');
    shouldBe(element.style.zIndex, '20');
    debug("");

    element = document.getElementById('positionedDiv');
    compStyle = getComputedStyle(element, null);
    debug("Positioned Div:");
    shouldBe(compStyle.zIndex, '20');
    shouldBe(element.style.zIndex, '20');
  }

  test();
}
