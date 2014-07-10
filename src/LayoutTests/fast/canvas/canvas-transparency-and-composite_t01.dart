/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure correct behaviour of composite on a
 * fully transparent color.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var ctx = document.createElement('canvas').getContext('2d');

  ctx.globalCompositeOperation = "source-over";
  ctx.fillStyle = 'rgba(0,0,0,0)';
  ctx.fillRect(0,0,100,100);

  ctx.save();
  ctx.translate(0,100);
  ctx.scale(1,-1);
  ctx.fillStyle = 'green';
  ctx.fillRect(0,0,100,100);
  ctx.restore();

  var imageData = ctx.getImageData(1, 1, 98, 98);
  var imgdata = imageData.data;
  shouldBe(imgdata[4], 0);
  shouldBe(imgdata[5], 128);
  shouldBe(imgdata[6], 0);
}
