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
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id=test_div>
        Test that text-align:-webkit-match-parent is parsed correctly.
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var testDiv = document.getElementById('test_div');
  testDiv.style.cssText = 'text-align:-webkit-match-parent';
  shouldBe(testDiv.style.textAlign, "-webkit-match-parent");
}
