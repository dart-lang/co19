/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";

main() {
  var ctx;

  checkPixel(x, y, r, g, b, a) {
    var data = ctx.getImageData(x,y,1,1).data;
    shouldBeList(data, [r,g,b,a]);
  }

  dynamic canvas = document.createElement("canvas");
  document.body.append(canvas);
  canvas.width = 100;
  canvas.height = 100;
  ctx = canvas.getContext("2d");
  ctx.moveTo(25,25);
  ctx.arc(25, 25, 25, Math.pi, 500*Math.pi, false);
  ctx.closePath();

  ctx.moveTo(75, 75);
  ctx.arc(75, 75, 25, 500*Math.pi, Math.pi, true);
  ctx.fillStyle = '#0f0';
  ctx.fill();

  checkPixel(25, 25, 0, 255, 0, 255);
  checkPixel(75, 75, 0, 255, 0, 255);
}
