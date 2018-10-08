/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that draw commands with big numbers cause no problems
 */
import "dart:html";
import "dart:math" as Math;

main() {
  newCanvasContext() {
    dynamic canvas = document.createElement("canvas");
    canvas.width = 100;
    canvas.height = 100;
    return canvas.getContext("2d");
  }

  dynamic ctx = newCanvasContext();
  ctx.fillStyle = '#0f0';
  ctx.fillRect(0, 0, 100, 50);
  ctx.moveTo(10500000000, 10500000000);
  ctx.lineTo(110, -10);
  ctx.lineTo(-10, 60);
  ctx.fill();
  ctx.getImageData(50, 25, 1, 1);

  ctx = newCanvasContext();
  ctx.fillStyle = '#0f0';
  ctx.scale(4500000000, 4500000000);
  ctx.moveTo(0, 0.5);
  ctx.lineTo(2, 0.5);
  ctx.stroke();
  ctx.getImageData(50, 25, 1, 1);

  ctx = newCanvasContext();
  ctx.fillStyle = '#0f0';
  ctx.fillRect(0, 0, 100, 50);
  ctx.scale(2, -4500000000);
  ctx.arc(25, 50, 56, 0, 2*Math.pi, false);
  ctx.fill();
  ctx.arc(105000000005, -105000000005, 105000000004, 0, 10500000000*Math.pi, false);
  ctx.fill();
  ctx.getImageData(50, 25, 1, 1);
}
