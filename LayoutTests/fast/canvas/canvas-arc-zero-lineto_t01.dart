/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Bug 55696: Series of tests to ensure zero-length arc extends
 * current subpath
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas" width="100" height="100"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic ctx = getContext2d("canvas");
  ctx.lineWidth = 4;

  shouldBeBlackPixel(x,y)
  {
    var data = ctx.getImageData(x, y, 1, 1).data;
    var rgba = data.take(4);
    if (data[0] != 0 || data[1] != 0 || data[2] != 0 || data[3] != 255) {
      testFailed("Pixel ($x,$y) should be black; " +
          "was ${rgba.toString()}");
    } else {
      testPassed("Pixel ($x,$y) is black.");
    }
  }

  // moveTo + empty arc (swing == 0)
  ctx.beginPath();
  ctx.moveTo(20, 20);
  ctx.arc(80, 30, 10, -Math.pi/2, -Math.pi/2, true);
  ctx.stroke();
  shouldBeBlackPixel(50, 20);

  // moveTo + empty arc (radius == 0)
  ctx.beginPath();
  ctx.moveTo(20, 40);
  ctx.arc(80, 40, 0, 0, 6, false);
  ctx.stroke();
  shouldBeBlackPixel(50, 40);

  // empty arc (swing == 0) + lineTo
  ctx.beginPath();
  ctx.arc(20, 50, 10, Math.pi/2, Math.pi/2, false);
  ctx.lineTo(80, 60);
  ctx.stroke();
  shouldBeBlackPixel(50, 60);

  // empty arc (radius == 0) + lineTo
  ctx.beginPath();
  ctx.arc(20, 80, 0, 0, 6, false);
  ctx.lineTo(80, 80);
  ctx.stroke();
  shouldBeBlackPixel(50, 80);
}
