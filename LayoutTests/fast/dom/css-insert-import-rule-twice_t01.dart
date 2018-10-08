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
import "pwd.dart";

main() {
  var style = new Element.html('''
    <style>
    @import url("$root/resources/css-insert-import-rule.css");
    div {
        width: 100px;
        height: 100px;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <div></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  (document.styleSheets[0] as CssStyleSheet).insertRule(
      '@import url("$root/resources/css-insert-import-rule.css");', 0);

  asyncStart();
  window.onLoad.first.then((_) {
    shouldBe(document.querySelector('div').getComputedStyle().backgroundColor,
      'rgb(0, 128, 0)');
    asyncEnd();
  });
}
