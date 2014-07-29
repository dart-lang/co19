/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that strokeText() doesn't produce a filled shadow.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var ctx = createContext2d("canvas");

  ctx.fillStyle = 'green';
  ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);

  // Stroke an 'I' with its shadow in the upper left corner.
  ctx.strokeStyle = 'white';
  ctx.lineWidth = 2;
  ctx.shadowColor = 'red';
  ctx.shadowOffsetX = -15;
  ctx.shadowOffsetY = 0;
  ctx.font = '128px sans-serif';
  ctx.strokeText("I", 0, 50);

  var imageData = ctx.getImageData(0, 0, 1, 1);
  var imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);
  shouldBe(imgdata[3], 255);
}
