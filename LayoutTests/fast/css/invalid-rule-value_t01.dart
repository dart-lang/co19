/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks that a rule with an invalid value does not
 * halt other style rules from being applied.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="test-invalid-rule" style="weight: *; color: rgb(0, 128, 0)"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById('test-invalid-rule').style.getPropertyValue('color'),
      'rgb(0, 128, 0)');
}
