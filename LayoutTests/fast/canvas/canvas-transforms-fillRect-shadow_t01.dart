/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Ensure correct behavior of canvas with fillRect+shadow after
 * translation+rotation+scaling. A blue and red checkered pattern should be
 * displayed.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";

main() {
  shouldBeAround(a, b) => shouldBeApprox(a, b, 20);

  dynamic canvas = document.createElement('canvas');
  document.body.append(canvas);
  canvas.setAttribute('width', '600');
  canvas.setAttribute('height', '600');
  var ctx = canvas.getContext('2d');

  ctx.fillStyle = 'rgba(0, 0, 255, 1.0)';
  ctx.shadowOffsetX = 100;
  ctx.shadowOffsetY = 100;

  ctx.translate(-100, -100);
  ctx.rotate(Math.pi/2);
  ctx.scale(2, 2);

  ctx.shadowColor = 'rgba(255, 0, 0, 1.0)';
  ctx.fillRect(100, -150, 50, 50);

  ctx.shadowColor = 'rgba(255, 0, 0, 0.5)';
  ctx.fillRect(200, -150, 50, 50);

  ctx.shadowBlur = 5;
  ctx.shadowColor = 'rgba(255, 0, 0, 1.0)';
  ctx.fillRect(100, -250, 50, 50);

  ctx.shadowColor = 'rgba(255, 0, 0, 0.5)';
  ctx.fillRect(200, -250, 50, 50);

  var d; // imageData.data

  // Verify solid shadow.
  d = ctx.getImageData(201, 205, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBe(d[3], 255);

  d = ctx.getImageData(298, 298, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBe(d[3], 255);

  d = ctx.getImageData(201, 298, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBe(d[3], 255);

  // Verify solid alpha shadow.
  d = ctx.getImageData(201, 401, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 127);

  d = ctx.getImageData(298, 450, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 127);

  d = ctx.getImageData(205, 498, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 127);

  // Verify blurry shadow.
  d = ctx.getImageData(399, 205, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 106);

  d = ctx.getImageData(500, 205, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 106);

  d = ctx.getImageData(499, 299, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 83);

  // Verify blurry alpha shadow.
  d = ctx.getImageData(398, 405, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 36);

  d = ctx.getImageData(405, 501, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 36);

  d = ctx.getImageData(405, 501, 1, 1).data;
  shouldBe(d[0], 255);
  shouldBe(d[1], 0);
  shouldBe(d[2], 0);
  shouldBeAround(d[3], 36);
}
