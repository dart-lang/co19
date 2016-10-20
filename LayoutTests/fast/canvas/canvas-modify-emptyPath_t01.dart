/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests behaviour of path modification APIs on an empty
 * path.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic canvas = document.createElement('canvas');
  canvas.width=300;
  canvas.height=300;
  var ctx = canvas.getContext('2d');

  getColor(x,y) {
    var imageData = ctx.getImageData(x, y, 1, 1);
    var data = imageData.data;
    return [data[0], data[1], data[2], data[3]];
  }

  // Test no drawing cases
  ctx.fillStyle = 'green';
  ctx.strokeStyle = 'red';
  ctx.lineWidth = 50;

  debug("Test lineTo");
  ctx.beginPath();
  ctx.fillRect(0, 0, 100, 100);
  ctx.lineTo(50, 50);
  ctx.stroke();
  shouldBeList(getColor(40,40), [0,128,0,255]);
  ctx.clearRect(0, 0, 300, 300);

  // Test when create rectangle path using a rectangle with width = height = 0.
  debug("Test canvas.rect() with width = height = 0.");
  ctx.strokeStyle = 'red';
  ctx.lineWidth = 10;
  ctx.beginPath();
  ctx.rect(0, 0, 0, 0);
  ctx.stroke();
  shouldBeList(getColor(1,1), [0,0,0,0]);
  ctx.clearRect(0, 0, 300, 300);

  // Test path modifications that result in drawing
  ctx.fillStyle = 'red';
  ctx.strokeStyle = 'green';

  debug("Test lineTo sequence");
  ctx.beginPath();
  ctx.fillRect(0, 0, 100, 100);
  ctx.lineTo(0, 50);
  ctx.lineTo(100, 50);
  ctx.stroke();
  shouldBeList(getColor(0,0), [255,0,0,255]);
  shouldBeList(getColor(50,50), [0,128,0,255]);
  ctx.clearRect(0, 0, 300, 300);

  debug("Test quadraticCurveTo");
  ctx.beginPath();
  ctx.fillRect(0, 0, 100, 100);
  ctx.quadraticCurveTo(0, 50, 100, 50);
  ctx.stroke();
  shouldBeList(getColor(10,10), [255,0,0,255]);
  shouldBeList(getColor(50,50), [0,128,0,255]);
  ctx.clearRect(0, 0, 300, 300);

  debug("Test quadraticCurveTo endpoint");
  ctx.beginPath();
  ctx.fillRect(0, 0, 100, 100);
  ctx.quadraticCurveTo(0, 50, 100, 50);
  ctx.lineTo(50, 100);
  ctx.stroke();
  shouldBeList(getColor(10,10), [255,0,0,255]);
  shouldBeList(getColor(99,51), [0,128,0,255]);
  shouldBeList(getColor(50,50), [0,128,0,255]);
  ctx.clearRect(0, 0, 300, 300);

  debug("Test bezierCurveTo");
  ctx.beginPath();
  ctx.fillRect(0, 0, 100, 100);
  ctx.bezierCurveTo(0, 50, 50, 50, 100, 50);
  ctx.stroke();
  shouldBeList(getColor(10,10), [255,0,0,255]);
  shouldBeList(getColor(50,50), [0,128,0,255]);
  ctx.clearRect(0, 0, 300, 300);

  debug("Test bezierCurveTo endpoint");
  ctx.beginPath();
  ctx.fillRect(0, 0, 100, 100);
  ctx.bezierCurveTo(0, 50, 50, 50, 100, 50);
  ctx.stroke();
  ctx.lineTo(50, 100);
  ctx.stroke();
  shouldBeList(getColor(10,10), [255,0,0,255]);
  shouldBeList(getColor(99,51), [0,128,0,255]);
  shouldBeList(getColor(50,50), [0,128,0,255]);
  ctx.clearRect(0, 0, 300, 300);
}
