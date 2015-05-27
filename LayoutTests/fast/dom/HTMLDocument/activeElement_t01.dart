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
    <input id="one"><input id="two">
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.activeElement, document.body);
  document.getElementById('one').focus();
  shouldBe(document.activeElement, document.getElementById('one'));
  document.getElementById('two').focus();
  shouldBe(document.activeElement, document.getElementById('two'));
  document.getElementById('two').blur();
  shouldBe(document.activeElement, document.body);
}
