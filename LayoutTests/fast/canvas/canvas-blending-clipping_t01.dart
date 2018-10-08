/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure correct results on applying different
 * blend modes when drawing with clipped regions.
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
    shouldBeCloseTo(ac[0], 0, sigma);
    shouldBeCloseTo(ac[1], 0, sigma);
    shouldBeCloseTo(ac[2], 0, sigma);
    shouldBeCloseTo(ac[3], 0, sigma);

    ac = actualColor(5, 5);
    shouldBeCloseTo(ac[0], expectedColor[0], sigma);
    shouldBeCloseTo(ac[1], expectedColor[1], sigma);
    shouldBeCloseTo(ac[2], expectedColor[2], sigma);
    shouldBeCloseTo(ac[3], expectedColor[3], sigma);
  }

  runTest() {
    dynamic canvas = document.createElement("canvas");
    var sigma = 5;
    canvas.width = 10;
    canvas.height = 10;
    context = canvas.getContext("2d");

    for (var i = 0; i < blendModes.length; ++i) {
      debug("Testing blend mode ${blendModes[i]}");

      context.clearRect(0, 0, 10, 10);
      context.save();
      context.beginPath();
      context.moveTo(3, 3);
      context.lineTo(3, 7);
      context.lineTo(7, 7);
      context.lineTo(7, 3);
      context.lineTo(3, 3);
      context.clip();

      drawBackdropColorInContext(context);
      context.globalCompositeOperation = blendModes[i];
      drawSourceColorInContext(context);
      checkBlendModeResult(i, context, sigma);
      context.restore();
      debug('');
    }
  }

  initHelpers();
  runTest();
}
