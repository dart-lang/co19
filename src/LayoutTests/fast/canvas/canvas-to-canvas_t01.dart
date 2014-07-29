/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test to ensure that canvas-to-canvas drawImage after a stroked
 * rect works correctly.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var canvas = document.createElement('canvas');
  var ctx = canvas.getContext('2d');

  ctx.lineWidth = 10;
  ctx.beginPath();
  ctx.strokeStyle = 'green';
  ctx.strokeRect(0, 0, 100, 100);

  var ctx2 = createContext2d("canvas");

  ctx2.fillStyle = 'red';
  ctx2.fillRect(0, 0, 100, 100);
  ctx2.drawImage(canvas, 0, 0);
  var imageData = ctx2.getImageData(0, 0, 1, 1);
  var imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);
}
