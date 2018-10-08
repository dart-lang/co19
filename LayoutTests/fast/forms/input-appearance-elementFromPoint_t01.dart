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
This tests that elementFromPoint will get the input element.
<input id="tf" style="-khtml-appearance: textfield; position: absolute; top: 25; left: 10;"></input>
      ''', treeSanitizer: new NullTreeSanitizer());

  showElement(x, y) {
    var result = document.getElementById('res');
    var myElement = document.elementFromPoint(x, y);
    shouldBe(myElement, document.getElementById('tf'));
  }

  showElement(15, 30);
}
