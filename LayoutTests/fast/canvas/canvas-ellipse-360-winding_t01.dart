/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests canvas full arc fill with nonzero winding rule.
 * Eight green concentric thick circumferences should be displayed.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";

main() {
  dynamic canvas = document.createElement('canvas');
  document.body.append(canvas);
  canvas.setAttribute('width', '300');
  canvas.setAttribute('height', '150');
  var ctx = canvas.getContext('2d');

  var r;
  var anticlockwise = true;
  ctx.beginPath();
  for (r = 200; r >= 10; r -= 10) {
    ctx.moveTo(150 + r, 75);
    ctx.ellipse(150, 75, r, r * 1.2, 0, 0, Math.pi * 2, anticlockwise);
    ctx.closePath();
    anticlockwise = !anticlockwise;
  }
  ctx.fillStyle = 'rgba(0, 255, 0, 1)';
  ctx.strokeStyle = 'rgba(0, 255, 0, 1)';
  ctx.fill();
  ctx.stroke();

  var imageData = ctx.getImageData(297, 75, 1, 1);
  var data = imageData.data;
  shouldBe(data[1], 0);

  imageData = ctx.getImageData(295, 144, 1, 1);
  data = imageData.data;
  shouldBe(data[1], 255);

  imageData = ctx.getImageData(272, 144, 1, 1);
  data = imageData.data;
  shouldBe(data[1], 255);

  imageData = ctx.getImageData(262, 144, 1, 1);
  data = imageData.data;
  shouldBe(data[1], 0);

  imageData = ctx.getImageData(239, 144, 1, 1);
  data = imageData.data;
  shouldBe(data[1], 0);

  imageData = ctx.getImageData(228, 144, 1, 1);
  data = imageData.data;
  shouldBe(data[1], 255);
}

