/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests drawImage with self as source image, copy composite
 * operation, and downsized destination rect. Regression test for issue
 * crbug.com/330711
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var canvas = document.createElement("canvas");
  canvas.width = 10;
  canvas.height = 10;
  var ctx = canvas.getContext('2d');

  ctx.globalCompositeOperation = 'copy';
  ctx.fillStyle = '#0f0';
  ctx.fillRect(0, 0, 10, 10);
  ctx.drawImageScaledFromSource(canvas, 0, 0, 10, 10, 0, 0, 5, 5);

  var imageData = ctx.getImageData(0, 0, 1, 1);
  var imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 255);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 255);

  imageData = ctx.getImageData(4, 4, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 255);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 255);

  imageData = ctx.getImageData(4, 5, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 0);

  imageData = ctx.getImageData(5, 4, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 0);
}
