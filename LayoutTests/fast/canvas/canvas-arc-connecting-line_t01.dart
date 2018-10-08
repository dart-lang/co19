/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that canvas arc()s are connected by a straight line. There
 * should be two C-shapes with a line from the bottom of the left one to the
 * top of the right one.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";

main() {
  dynamic canvas = document.createElement('canvas');
  document.body.append(canvas);
  canvas.setAttribute('width', '300');
  canvas.setAttribute('height', '300');
  var ctx = canvas.getContext('2d');
  ctx.fillStyle = '#0f0';
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  ctx.lineJoin = 'bevel';
  ctx.lineWidth = 12;
  ctx.beginPath();
  ctx.arc(200, 50, 40, Math.pi / 2, -Math.pi / 2, false);
  ctx.arc(100, 50, 40, Math.pi / 2, -Math.pi / 2, false);
  ctx.stroke();

  var imageData = ctx.getImageData(0, 0, 1, 1);
  var imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 255);
  shouldBe(imgdata[2], 0);

  imageData = ctx.getImageData(125, 30, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 255);
  shouldBe(imgdata[2], 0);

  imageData = ctx.getImageData(125, 70, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 0);
  shouldBe(imgdata[2], 0);
}
