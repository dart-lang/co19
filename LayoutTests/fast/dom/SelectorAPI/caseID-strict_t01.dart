/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div style="display: none">
    <span id="lower1">lower 1</span><br>
    <span id="lower2">lower 2</span><br>
    <span id="UPPER1">UPPER 1</span><br>
    <span id="UPPER2">UPPER 2</span><br>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.querySelector('#lower1').text, 'lower 1');
  shouldBeNull(document.querySelector('#LOWER2'));
  shouldBe(document.querySelector('#UPPER1').text, 'UPPER 1');
  shouldBeNull(document.querySelector('#upper2'));

  shouldBeTrue(document.getElementById('lower1').matches('#lower1'));
  shouldBeFalse(document.getElementById('lower2').matches('#LOWER2'));
  shouldBeTrue(document.getElementById('UPPER1').matches('#UPPER1'));
  shouldBeFalse(document.getElementById('UPPER2').matches('#upper2'));
}
