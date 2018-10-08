/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that resizing a canvas to very large dimensions after a
 * composite does not crash
 */
import "dart:html";
import "../../testcommon.dart";
import "../../resources/run-after-display.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="c" width=100 height=100></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic c = document.getElementById("c");

  resize() {
    c.width  =  5000;
    c.height = 10000;
    asyncEnd();
  }

  // Force a composite at normal width/height to ensure we have a compositing layer for the canvas.
  runAfterDisplay(resize);
  asyncStart();
}
