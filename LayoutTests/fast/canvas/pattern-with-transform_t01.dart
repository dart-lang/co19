/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for canvas regression where pattern transforms were
 * ignored https://bugs.webkit.org/show_bug.cgi?id=21498
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  pixelValueAt(context, x, y) {
    var imageData = context.getImageData(x, y, 1, 1);
    return imageData.data;
  }

  pixelShouldBe(context, x, y, expectedPixel) {
    var pixel = pixelValueAt(context, x, y);

    shouldBeList(pixel, expectedPixel);
  }

  dynamic canvas;

  fillWithColor(context, color) {
    context.save();
    context.fillStyle = color;
    context.fillRect(0, 0, canvas.width, canvas.height);
    context.restore();
  }

  canvas = document.createElement("canvas");
  canvas.height = 100;
  canvas.width = 100;
  canvas.style.height = "100";
  canvas.style.width = "100";

  document.body.append(canvas);

  dynamic patternImage = document.createElement("canvas");
  patternImage.height = 10;
  patternImage.width = 10;
  var patternImageCtx = patternImage.getContext('2d');
  fillWithColor(patternImageCtx, "green");
  var greenPixel = pixelValueAt(patternImageCtx, 0, 0);


  var ctx = canvas.getContext('2d');
  var pattern = ctx.createPattern(patternImage, "no-repeat");

  fillWithColor(ctx, "blue");

  ctx.fillStyle = pattern;
  ctx.translate(20, 20);
  ctx.fillRect(0, 0, 10, 10);
  pixelShouldBe(ctx, 20, 20, greenPixel);
}
