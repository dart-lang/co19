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

main() {
  document.body.setInnerHtml('''
      The canvas below should show a gradient with zero stops, which according to the specification is filled with transparant black, ie. not visible. This tests <a href="http://bugs.webkit.org/show_bug.cgi?id=13784">Bug 13784, REGRESSION (r13744-13750): Crash with empty gradient when drawing to canvas</a></p>
      <canvas id="c"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic ctx = getContext2d("c");
  ctx.fillStyle = ctx.createLinearGradient(0, 0, 0, 50);
  ctx.fillRect(0, 0, 300, 150);
}
