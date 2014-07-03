/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure correct results on applying different
 * blend modes when drawing a rectangle with shadow.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "canvas-blending-helpers.dart";

main() {
  var context;
  actualColor(x, y) {
    return context.getImageData(x, y, 1, 1).data;
  }

  checkBlendModeResult(i, context, sigma) {
    var expectedColor = blendColors([129 / 255, 1, 129 / 255, 1], [1, 129 / 255, 129 / 255, 1], i);
    var ac = actualColor(0, 0);
    shouldBeCloseTo(ac[0], expectedColor[0], sigma);
    shouldBeCloseTo(ac[1], expectedColor[1], sigma);
    shouldBeCloseTo(ac[2], expectedColor[2], sigma);
    shouldBeCloseTo(ac[3], expectedColor[3], sigma);

    var expectedShadowColor = blendColors([192 / 255, 192 / 255, 192 / 255, 1], [1, 129 / 255, 129 / 255, 1], i);
    ac = actualColor(11, 11);
    shouldBeCloseTo(ac[0], expectedShadowColor[0], sigma);
    shouldBeCloseTo(ac[1], expectedShadowColor[1], sigma);
    shouldBeCloseTo(ac[2], expectedShadowColor[2], sigma);
    shouldBeCloseTo(ac[3], expectedShadowColor[3], sigma);
  }

  runTest() {
    var canvas = document.createElement("canvas");
    var sigma = 5;
    canvas.width = 12;
    canvas.height = 12;
    context = canvas.getContext("2d");

    for (var i = 0; i < blendModes.length; ++i) {
      debug("Testing blend mode " + blendModes[i]);

      context.clearRect(0, 0, 12, 12);
      context.save();
      drawBackdropColorWithShadowInContext(context);
      context.globalCompositeOperation = blendModes[i];
      drawSourceColorRectOverShadow(context);
      checkBlendModeResult(i, context, sigma);
      context.restore();
      debug('');
    }
  }

  initHelpers();
  runTest();
}
