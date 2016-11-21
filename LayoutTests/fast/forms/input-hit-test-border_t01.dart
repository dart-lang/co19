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
  document.body.setInnerHtml('''
      This tests hit testing on the border and padding areas of an input. Clicks in either should hit
      the input element.
      <input id="tf" style="position: absolute; top: 25px; left: 10px; border: 10px inset gray; padding: 10px;">
      ''', treeSanitizer: new NullTreeSanitizer());

  runTest() {
    InputElement input = document.getElementById('tf') as InputElement;

    var borderElement = document.elementFromPoint(18, 34);  // in border
    var paddingElement = document.elementFromPoint(25, 41);  // in padding

    shouldBeTrue(borderElement == input && paddingElement == input);
  }

  window.addEventListener('click', (Event e) {
    window.console.log('page x ${(e as MouseEvent).page.x} + page y ${(e as MouseEvent).page.y}');
  }, false);

  runTest();
}
