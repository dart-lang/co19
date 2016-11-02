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
    <div style="display: none">
    <span id="lower1">lower</span><br>
    <P id="UPPER1">UPPER</P><br>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.querySelector('div SPAN').text, 'lower');
  shouldBe(document.querySelector('div p').text, 'UPPER');

  shouldBeTrue(document.getElementById('lower1').matches('div SPAN'));
  shouldBeTrue(document.getElementById('UPPER1').matches('div p'));
}

