/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure correct results on applying different
 * blend modes when drawing an image on top of another.
 */
import "dart:html";
import "../../testcommon.dart";
import "canvas-blending-helpers.dart";

main() {
  var context;
  actualColor(x, y) {
    return context.getImageData(x, y, 1, 1).data;
  }

  checkBlendModeResult(i, context, sigma) {
    var expectedColor = blendColors(
        [129 / 255, 1, 129 / 255, 1], [1, 129 / 255, 129 / 255, 1], i);
    var ac = actualColor(0, 0);
    shouldBeCloseTo(ac[0], expectedColor[0], sigma);
    shouldBeCloseTo(ac[1], expectedColor[1], sigma);
    shouldBeCloseTo(ac[2], expectedColor[2], sigma);
    shouldBeCloseTo(ac[3], expectedColor[3], sigma);
  }

  drawElement(context, i) {
    if (i >= blendModes.length) {
      asyncEnd();
      return;
    }
    debug("Testing blend mode " + blendModes[i]);

    context.clearRect(0, 0, 10, 10);
    context.save();
    drawBackdropColorImageInContext(context, () {
      context.globalCompositeOperation = blendModes[i];

      drawSourceColorImageInContext(context, () {
        checkBlendModeResult(i, context, 5);
        context.restore();
        debug('');
        drawElement(context, ++i);
      });
    });
  }

  runTest() {
    dynamic canvas = document.createElement("canvas");
    canvas.width = 10;
    canvas.height = 10;
    context = canvas.getContext("2d");
    drawElement(context, 0);
  }

  initHelpers();
  asyncStart();
  runTest();
}
