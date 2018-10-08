/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that disabling the imageSmoothingEnabled attribute still
 * works after multiple repaints
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="destination" width="300" height="300"></canvas>
      <canvas id="source" width="300" height="300"></canvas>
      ''', treeSanitizer: new NullTreeSanitizer());

  // This is a regression test for bug https://bugs.webkit.org/show_bug.cgi?id=89018

  dynamic dstCanvas = document.getElementById("destination");
  var dstCtx = dstCanvas.getContext('2d');
  dynamic srcCanvas = document.getElementById("source");
  var srcCtx = srcCanvas.getContext('2d');

  draw()
  {
    srcCtx.clearRect(0, 0, 300, 300);
    dstCtx.clearRect(0, 0, 300, 300);
    srcCtx.fillStyle = "rgb(255, 0, 0)";
    srcCtx.fillRect(0, 0, 1, 1);
    srcCtx.fillStyle = "rgb(0, 255, 0)";
    srcCtx.fillRect(1, 0, 1, 1);
    dstCtx.imageSmoothingEnabled = false;
    dstCtx.drawImageScaledFromSource(srcCanvas, 0, 0, 2, 1, 0, 0, 300, 300);
  }

  testResult() {
    debug("Test that the image is not filtered");
    var left_of_center_pixel = dstCtx.getImageData(149, 150, 1, 1);
    shouldBe(left_of_center_pixel.data[0], 255);
    shouldBe(left_of_center_pixel.data[1], 0);
    shouldBe(left_of_center_pixel.data[2], 0);
    var right_of_center_pixel = dstCtx.getImageData(150, 150, 1, 1);
    shouldBe(right_of_center_pixel.data[0], 0);
    shouldBe(right_of_center_pixel.data[1], 255);
    shouldBe(right_of_center_pixel.data[2], 0);
    asyncEnd();
  }

  // Bug 89018 requires 2 draw iteration in order to manifest itself.
  var drawIterations = 2;

  BrowserPaint(_) {
    draw();
    if (drawIterations > 0) {
      drawIterations = drawIterations - 1;
      window.requestAnimationFrame(BrowserPaint);
    } else {
      testResult();
    }
  }

  onLoadHandler(_)
  {
    BrowserPaint(null);
  }

  asyncStart();
  window.onLoad.listen(onLoadHandler);
}
