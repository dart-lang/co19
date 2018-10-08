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
  document.body.setInnerHtml('''
      <link href=$root/resources/grid.css rel=stylesheet>
      <p><a href="https://bugs.webkit.org/show_bug.cgi?id=108834">Bug 108834</a>: [CSS Grid Layout] Heap-buffer-overflow in std::sort</p>
      <p>This test PASS if it doesn't CRASH.</p>
      <div class="grid">
          <div style="grid-column: 100;"></div>
          <div style="grid-row: 30;"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    asyncEnd();
  });
}
