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
import "../../resources/run-after-display.dart";

main() {
  document.body.setInnerHtml('''
      <p><b>BUG ID:</b> <a href="https://bugs.webkit.org/show_bug.cgi?id=43341">Bugzilla bug 43341</a>
      Setting canvas width after canvas already rendered resets canvas data appropriately, but doesn't repaint immediately.
      <p id="success" style="background-color:palegreen; padding:3px;"><b>TEST <div>PASS</div>:</b> 
      The canvas should go blank due to setting on the canvas width.
      </p>

      <hr>

      <p class="output">Actual output: (blank canvas)</p>
      <canvas id="c1" class="output" width="100" height="50" ></canvas>
      ''', treeSanitizer: new NullTreeSanitizer());

  repaintTest() {
    dynamic canvas = document.getElementById('c1');
    var offset = document.body.offsetLeft; // Forces layout
    canvas.width = canvas.width; // Should wipe canvas clean
    asyncEnd();
  }

  runAfterDisplay(repaintTest);

  asyncStart();

  dynamic canvas = document.getElementById('c1');
  var ctx = canvas.getContext('2d');
  ctx.fillStyle = '#0f0';
  ctx.fillRect(0, 0, 100, 50);
}
