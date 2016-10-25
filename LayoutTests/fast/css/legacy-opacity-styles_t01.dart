/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks that the legacy -webkit-opacity style is
 * mapped to the opacity style.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="test-opacity" style="opacity: 0.2;"></div>
      <div id="test-webkit-opacity" style="-webkit-opacity: 0.8;"></div>
      <p id="description"></p>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById('test-opacity').style.getPropertyValue('opacity'), '0.2');
  shouldBe(document.getElementById('test-opacity').style.getPropertyValue('-webkit-opacity'), '0.2');

  shouldBe(document.getElementById('test-webkit-opacity').style.getPropertyValue('opacity'), '0.8');
  shouldBe(document.getElementById('test-webkit-opacity').style.getPropertyValue('-webkit-opacity'), '0.8');
}
