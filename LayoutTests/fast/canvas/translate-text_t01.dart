/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for chromium's canvas bug where fillText resets the
 * current context https://bugs.webkit.org/show_bug.cgi?id=26436 . You must see
 * green box with message 'This text should be seen', and black box below the
 * green box.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  pixelValueAt(context, x, y) {
    var imageData = context.getImageData(x, y, 1, 1);
    return imageData.data;
  }

  pixelShouldBe(context, x, y, expectedPixel) {
    var pixel = pixelValueAt(context, x, y);

    debug("pixel $x, $y");
    shouldBeList(pixel, expectedPixel);
  }

  var canvas = document.createElement("canvas");
  canvas.height = 100;
  canvas.width = 500;
  canvas.style.height = "100";
  canvas.style.width = "500";

  document.body.append(canvas);

  var ctx = canvas.getContext('2d');
  ctx.fillStyle = 'rgb(0,255,0)';
  ctx.fillRect(0, 0, 500, 100);
  ctx.fillStyle = 'rgb(0,0,0)';
  ctx.fillText("This text should be seen", 20, 20);
  ctx.translate(0, 50);
  ctx.font = "10pt Arial";
  ctx.fillText("This text should NOT be seen", 20, 20);
  // If fillText resets the current context, this rectangle won't hide the text.
  ctx.fillStyle = 'rgb(0,0,0)';
  ctx.fillRect(0, 0, 500, 50);

  pixelShouldBe(ctx, 0, 0, [0,255,0,255]);
}
