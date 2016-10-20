/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks if pattern changes after the source canvas is
 * modified. See https://bugs.webkit.org/show_bug.cgi?id=20578.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  // Based on http://philip.html5.org/tests/canvas/suite/tests/2d.pattern.modify.canvas1.html

  dataToArray(data) {
    var result = new List(data.length);
    for (var i = 0; i < data.length; i++)
      result[i] = data[i];
    return result;
  }

  getPixel(ctx, x, y) {
    var data = ctx.getImageData(x,y,1,1);
    if (data == null) // getImageData failed, which should never happen
      return [-1,-1,-1,-1];
    return dataToArray(data.data);
  }

  pixelShouldBe(ctx, x, y, colour) {
    shouldBeList(getPixel(ctx, x, y), colour);
  }

  createCanvasImage(width, height, colour) {
    dynamic c = document.createElement("canvas");
    c.width = width;
    c.height = height;
    var context = c.getContext("2d");
    context.fillStyle = colour;
    context.fillRect(0,0,width,height);
    return c;
  }

  dynamic canvas = createCanvasImage(100, 50, '#fff');
  var ctx = canvas.getContext('2d');

  var patternCanvas = createCanvasImage(100, 50, '#0f0');
  var pattern = ctx.createPattern(patternCanvas, 'no-repeat');

  // Modify the original canvas after we create a pattern.
  var patternCtx = patternCanvas.getContext('2d');
  patternCtx.fillStyle = '#f00';
  patternCtx.fillRect(0, 0, 100, 50);

  ctx.fillStyle = pattern;
  ctx.fillRect(0, 0, 100, 50);

  pixelShouldBe(ctx, 1, 1, [0, 255, 0, 255]);
  pixelShouldBe(ctx, 98, 1, [0, 255, 0, 255]);
  pixelShouldBe(ctx, 1, 48, [0, 255, 0, 255]);
  pixelShouldBe(ctx, 98, 48, [0, 255, 0, 255]);
}
