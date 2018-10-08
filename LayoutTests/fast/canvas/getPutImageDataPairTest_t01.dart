/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description putImageData(getImageData) pair test
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <h3>Test that putImageData(getImageData) pair leaves canvas ImageData the same.</h3>
      <canvas id="c" class="output" width="64" height="64"><p class="fallback">FAIL (fallback content)</p></canvas>
      <br>
      Result: <a id="result"></a>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic ctx;

  getPutImageData(numIters, ctx, r, g, b, a) {
    var x = 0, y = 0, w = ctx.canvas.width, h = ctx.canvas.height;

    // Paint the canvas green to start
    ctx.fillStyle = 'rgba(0, 255, 0, 1)';
    ctx.fillRect(x,y,w,h);

    // Now paint the canvas a random hue of gray
    var color = 'rgba($r,$g,$b,$a)'; 
    ctx.fillStyle = color;
    ctx.fillRect(x,y,w,h);

    // Get the current "original" image data
    var origImageData = ctx.getImageData(x, y, w, h);
    ctx.putImageData(origImageData, x, y);

    // Get and put the image data 'numIters' times
    for(var i = 0; i < numIters; i++)
    ctx.putImageData(ctx.getImageData(x,y,w,h), x,y);

    // Grab new current image data
    var currImageData = ctx.getImageData(x, y, w, h);

    // Verify that original and new current image datas are equal
    for(var i = 0; i < currImageData.data.length; i++) {
      var origSubpixel = origImageData.data[i];
      var currSubpixel = currImageData.data[i];

      // If even 1 subpixel is off, return failure
      if (origSubpixel != currSubpixel)
        return false;
    }
    return true;
  }

  dynamic canvas = document.getElementById("c");
  ctx = canvas.getContext("2d");
  var passed = getPutImageData(50, ctx, 0, 0, 0, 0.0);
  passed = passed || getPutImageData(50, ctx, 0, 0, 0, 0.5);
  passed = passed || getPutImageData(50, ctx, 0, 0, 0, 1.0);
  passed = passed || getPutImageData(50, ctx, 127, 128, 129, 0.49);
  passed = passed || getPutImageData(50, ctx, 127, 128, 129, 0.51);
  passed = passed || getPutImageData(50, ctx, 127, 128, 129, 0.5);
  passed = passed || getPutImageData(50, ctx, 128, 128, 128, 0.0);
  passed = passed || getPutImageData(50, ctx, 128, 128, 128, 0.5);
  passed = passed || getPutImageData(50, ctx, 128, 128, 128, 1.0);

  var result_a = document.getElementById("result");
  if (!passed)
    result_a.innerHtml = "FAIL";
  else
    result_a.innerHtml = "PASS";
}

