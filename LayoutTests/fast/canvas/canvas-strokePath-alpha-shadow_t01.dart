/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Ensure correct behavior of canvas with path stroke using a
 * strokeStyle color with alpha and a shadow
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";

main() {
  shouldBeAround(a, b) => shouldBeApprox(a, b, 15);

  dynamic canvas = document.createElement('canvas');
  document.body.append(canvas);
  canvas.setAttribute('width', '600');
  canvas.setAttribute('height', '1100');
  var ctx = canvas.getContext('2d');

  ctx.save();
  ctx.strokeStyle = 'rgba(0, 0, 255, 0.5)';
  ctx.shadowColor = 'rgba(255, 0, 0, 0.5)';
  ctx.shadowOffsetX = 250;
  ctx.lineWidth = 50;

  strokePath(x, y) {
    ctx.beginPath();
    ctx.arc(x, y, 75, 0, Math.pi*2, true);
    ctx.stroke();
  }

  // Alpha shadow.
  ctx.shadowBlur = 0;
  strokePath(150, 150);

  // Blurry shadow.
  ctx.shadowBlur = 10;
  strokePath(150, 400);

  ctx.rotate(Math.pi/2);

  // Rotated alpha shadow.
  ctx.shadowBlur = 0;
  strokePath(650, -150);

  // Rotated blurry shadow.
  ctx.shadowBlur = 10;
  strokePath(900, -150);

  ctx.restore();

  var imageData, data;
  ctx.fillStyle = 'black';

  test(alphaTestFunction, x, y, r, g, b, a) {
    // Get pixel.
    imageData = ctx.getImageData(x, y, 1, 1);
    data = imageData.data;
    // Test pixel color components.
    shouldBe(data[0], r);
    shouldBe(data[1], g);
    shouldBe(data[2], b);
    alphaTestFunction(data[3], a);
    // Plot test point.
    ctx.fillRect(x, y, 3, 3);
  }

  debug('Verifying alpha shadow...');
  test(shouldBe, 400, 150, 0, 0, 0, 0);
  test(shouldBeAround, 400, 75, 255,  0, 0, 64);
  test(shouldBeAround, 400, 225, 255, 0, 0, 64);
  test(shouldBeAround, 325, 150, 255, 0, 0, 64);
  test(shouldBeAround, 475, 150, 255, 0, 0, 64);

  debug(' ');
  debug('Verifying blurry shadow...');
  test(shouldBe, 400, 400, 0, 0, 0, 0);
  test(shouldBeAround, 400, 300, 255, 0, 0, 31);
  test(shouldBeAround, 400, 500, 255, 0, 0, 31);
  test(shouldBeAround, 300, 400, 255, 0, 0, 31);
  test(shouldBeAround, 500, 400, 255, 0, 0, 31);

  debug(' ');
  debug('Verifying rotated alpha shadow...');
  test(shouldBe, 400, 650, 0, 0, 0, 0);
  test(shouldBeAround, 400, 575, 255, 0, 0, 64);
  test(shouldBeAround, 400, 725, 255, 0, 0, 64);
  test(shouldBeAround, 325, 650, 255, 0, 0, 64);
  test(shouldBeAround, 475, 650, 255, 0, 0, 64);

  debug(' ');
  debug('Verifying rotated blurry shadow...');
  test(shouldBe, 400, 900, 0, 0, 0, 0);
  test(shouldBeAround, 400, 800, 255, 0, 0, 31);
  test(shouldBeAround, 400, 1000, 255, 0, 0, 31);
  test(shouldBeAround, 300, 900, 255, 0, 0, 31);
  test(shouldBeAround, 500, 900, 255, 0, 0, 31);

  debug(' ');
}
