/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure correct behavior of
 * canvas.fillRect().
 */
import "../../testcommon.dart";

main() {
  dynamic ctx = createContext2d("canvas");

  // Fill rect with height = width = 0.
  debug("Test canvas.fillRect() with height = width = 0.");
  ctx.fillStyle = 'red';
  ctx.fillRect(0, 0, 0, 0);

  var imageData = ctx.getImageData(0, 0, 1, 1);
  var imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);

  ctx.clearRect(0, 0, 1, 1);

  // Fill rect with height = 0, width = 1.
  debug("Test canvas.fillRect() with height = 0, width = 1.");
  ctx.fillStyle = 'red';
  ctx.fillRect(0, 0, 1, 0);

  imageData = ctx.getImageData(0, 0, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);

  ctx.clearRect(0, 0, 1, 1);

  // Fill rect with height = 1, width = 0.
  debug("Test canvas.fillRect() with height = 1, width = 0.");
  ctx.fillStyle = 'red';
  ctx.fillRect(0, 0, 0, 1);

  imageData = ctx.getImageData(0, 0, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);

  ctx.clearRect(0, 0, 1, 1);
}
