/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure correct behaviour of calling canvas
 * methods with illegal arguments (Infintiy and NaN)
 */
import "../../testcommon.dart";

var NaN = double.nan;
var Inf = double.infinity;
var NegInf = double.negativeInfinity;

main() {
  debug("Test scale.");
  dynamic ctx = createContext2d("canvas");

  ctx.scale(NaN, 1);
  ctx.fillStyle = 'green';
  ctx.fillRect(0, 0, 100, 100);

  var imageData = ctx.getImageData(50, 50, 1, 1);
  var imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);

  ctx = createContext2d("canvas");

  ctx.scale(1, NaN);
  ctx.fillStyle = 'green';
  ctx.fillRect(0, 0, 100, 100);

  imageData = ctx.getImageData(50, 50, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);

  ctx = createContext2d("canvas");

  ctx.scale(Inf, 1);
  ctx.fillStyle = 'green';
  ctx.fillRect(0, 0, 100, 100);

  imageData = ctx.getImageData(50, 50, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);

  ctx = createContext2d("canvas");

  ctx.scale(1, Inf);
  ctx.fillStyle = 'green';
  ctx.fillRect(0, 0, 100, 100);

  imageData = ctx.getImageData(50, 50, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);

  debug("Test translate.");
  ctx = createContext2d("canvas");

  ctx.translate(NaN, 1);
  ctx.fillStyle = 'green';
  ctx.fillRect(0, 0, 100, 100);

  imageData = ctx.getImageData(50, 50, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);

  ctx = createContext2d("canvas");

  ctx.translate(1, NaN);
  ctx.fillStyle = 'green';
  ctx.fillRect(0, 0, 100, 100);

  imageData = ctx.getImageData(50, 50, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);

  ctx = createContext2d("canvas");

  ctx.translate(Inf, 1);
  ctx.fillStyle = 'green';
  ctx.fillRect(0, 0, 100, 100);

  imageData = ctx.getImageData(50, 50, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);

  ctx = createContext2d("canvas");

  ctx.translate(1, Inf);
  ctx.fillStyle = 'green';
  ctx.fillRect(0, 0, 100, 100);

  imageData = ctx.getImageData(50, 50, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);

  debug("Test rotate.");
  ctx = createContext2d("canvas");

  ctx.rotate(NaN);
  ctx.fillStyle = 'green';
  ctx.fillRect(0, 0, 100, 100);

  imageData = ctx.getImageData(50, 50, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);

  ctx = createContext2d("canvas");

  ctx.rotate(Inf);
  ctx.fillStyle = 'green';
  ctx.fillRect(0, 0, 100, 100);

  imageData = ctx.getImageData(50, 50, 1, 1);
  imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 128);
  shouldBe(imgdata[2], 0);
}
