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
  dynamic style = new Element.html('''
      <style>
      .x:after { content:counter(c, asterisks) ""; counter-increment:c 1550; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div>
          <span class="x">
          <div></div>
          <span class="x">
          <p>
          <p>
          PASS if no assert or crash in debug
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  runTest(_) {
    style.sheet.insertRule("div { counter-reset: c 141170 }", 0);
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(runTest);
}
