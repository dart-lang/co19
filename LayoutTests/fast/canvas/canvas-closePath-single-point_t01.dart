/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test the behavior of closePath on a path with a single point
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var ctx = createContext2d("canvas");

  document.body.append(ctx.canvas);

  ctx.strokeStyle = '#f00';
  ctx.lineWidth = 20;

  ctx.fillStyle = '#0f0';
  ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);

  ctx.beginPath();
  ctx.moveTo(10, 10);
  ctx.lineTo(100, 100);
  ctx.closePath();
  ctx.stroke();

  var imageData = ctx.getImageData(0, 0, 1, 1);
  var imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 255);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 255);
}
