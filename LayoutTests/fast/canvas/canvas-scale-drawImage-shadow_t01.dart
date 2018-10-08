/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Ensure correct behavior of canvas with drawImage+shadow after
 * scaling. A blue and red checkered pattern should be displayed.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  shouldBeAround(a, b) => shouldBeApprox(a, b, 10);

  // Create auxiliary canvas to draw to and create an image from.
  // This is done instead of simply loading an image from the file system
  // because that would throw a SECURITY_ERR DOM Exception.
  dynamic aCanvas = document.createElement('canvas');
  aCanvas.setAttribute('width', '50');
  aCanvas.setAttribute('height', '50');
  dynamic aCtx = aCanvas.getContext('2d');

  // Fill the same canvas.
  aCtx.fillStyle = 'rgba(0, 0, 255, 1)';
  aCtx.fillRect(0, 0, 50, 50);

  var ctx, img;
  var d; // imageData.data

  checkPixels() {

    // Verify solid shadow.
    d = ctx.getImageData(205, 205, 1, 1).data;
    shouldBe(d[0], 255);
    shouldBe(d[1], 0);
    shouldBe(d[2], 0);
    shouldBe(d[3], 255);

    d = ctx.getImageData(295, 295, 1, 1).data;
    shouldBe(d[0], 255);
    shouldBe(d[1], 0);
    shouldBe(d[2], 0);
    shouldBe(d[3], 255);

    d = ctx.getImageData(205, 295, 1, 1).data;
    shouldBe(d[0], 255);
    shouldBe(d[1], 0);
    shouldBe(d[2], 0);
    shouldBe(d[3], 255);

    // Verify solid alpha shadow.
    d = ctx.getImageData(201, 401, 1, 1).data;
    shouldBe(d[0], 255);
    shouldBe(d[1], 0);
    shouldBe(d[2], 0);
    shouldBeAround(d[3], 76);

    d = ctx.getImageData(290, 401, 1, 1).data;
    shouldBe(d[0], 255);
    shouldBe(d[1], 0);
    shouldBe(d[2], 0);
    shouldBeAround(d[3], 76);

    d = ctx.getImageData(290, 498, 1, 1).data;
    shouldBe(d[0], 255);
    shouldBe(d[1], 0);
    shouldBe(d[2], 0);
    shouldBeAround(d[3], 76);

    // Verify blurry shadow.
    d = ctx.getImageData(398, 205, 1, 1).data;
    shouldBe(d[0], 255);
    shouldBe(d[1], 0);
    shouldBe(d[2], 0);
    shouldBeAround(d[3], 83);

    d = ctx.getImageData(501, 205, 1, 1).data;
    shouldBe(d[0], 255);
    shouldBe(d[1], 0);
    shouldBe(d[2], 0);
    shouldBeAround(d[3], 83);

    d = ctx.getImageData(500, 300, 1, 1).data;
    shouldBe(d[0], 255);
    shouldBe(d[1], 0);
    shouldBe(d[2], 0);
    shouldBeAround(d[3], 53);

    // Verify blurry alpha shadow.
    d = ctx.getImageData(398, 405, 1, 1).data;
    shouldBe(d[0], 255);
    shouldBe(d[1], 0);
    shouldBe(d[2], 0);
    shouldBeAround(d[3], 24);

    d = ctx.getImageData(405, 501, 1, 1).data;
    shouldBe(d[0], 255);
    shouldBe(d[1], 0);
    shouldBe(d[2], 0);
    shouldBeAround(d[3], 24);

    d = ctx.getImageData(405, 501, 1, 1).data;
    shouldBe(d[0], 255);
    shouldBe(d[1], 0);
    shouldBe(d[2], 0);
    shouldBeAround(d[3], 24);

    asyncEnd();
  }

  drawImageToCanvasAndCheckPixels(_) {
    ctx.scale(2, 2);
    ctx.shadowOffsetX = 100;
    ctx.shadowOffsetY = 100;
    ctx.fillStyle = 'rgba(0, 0, 255, 1)';

    ctx.shadowColor = 'rgba(255, 0, 0, 1.0)';
    ctx.drawImage(img, 50, 50);

    ctx.shadowColor = 'rgba(255, 0, 0, 0.3)';
    ctx.drawImage(img, 50, 150);

    ctx.shadowColor = 'rgba(255, 0, 0, 1.0)';
    ctx.shadowBlur = 10;
    ctx.drawImage(img, 150, 50);

    ctx.shadowColor = 'rgba(255, 0, 0, 0.3)';
    ctx.drawImage(img, 150, 150);

    checkPixels();
  }

  // Create the image object to be drawn on the master canvas.
  img = new ImageElement();
  asyncStart();
  img.onLoad.listen(drawImageToCanvasAndCheckPixels);
  img.src = aCanvas.toDataUrl(); // set a data URI of the base64 encoded image as the source

  // Create master canvas.
  dynamic canvas = document.createElement('canvas');
  document.body.append(canvas);
  canvas.setAttribute('width', '1000');
  canvas.setAttribute('height', '1000');
  ctx = canvas.getContext('2d');
}
