/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that StyleSheet.parentStyleSheet works properly.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic style = new Element.html('''
        <style>
        @import url("data:text/css,#test{}");
        </style>
        ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="test"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test(_) {
    shouldBe(style.sheet.cssRules[0].styleSheet.parentStyleSheet, style.sheet);
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(test);
}
