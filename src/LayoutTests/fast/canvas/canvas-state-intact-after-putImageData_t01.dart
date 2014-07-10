/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that the rendering context state is intact after a call to
 * putImageData()
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var ctx = document.createElement('canvas').getContext('2d');

  ctx.fillStyle = 'red';
  ctx.fillRect(0, 0, 1, 1);

  debug("Checking initial state for sanity");
  var imageData = ctx.getImageData(0, 0, 2, 1);
  var imgdata = imageData.data;
  shouldBe(ctx.fillStyle, '#ff0000');
  shouldBe(imgdata[0], 255);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 255);
  shouldBe(imgdata[4], 0);
  shouldBe(imgdata[5], 0);
  shouldBe(imgdata[6], 0);
  shouldBe(imgdata[7], 0);

  debug("Calling putImageData()");
  ctx.putImageData(imageData, 1, 1);
  imageData = ctx.getImageData(1, 1, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 255);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 255);

  debug("Checking if state is intact");
  shouldBe(ctx.fillStyle, '#ff0000');

  ctx.fillRect(2, 2, 1, 1);
  imageData = ctx.getImageData(2, 2, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 255);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 255);
}
