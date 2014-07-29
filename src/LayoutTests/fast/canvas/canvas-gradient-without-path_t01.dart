/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure that no gradient is drawn without
 * path
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var ctx = createContext2d("canvas");

  ctx.fillStyle = 'green';
  ctx.fillRect(0, 0, 100, 100);

  var gradient = ctx.createLinearGradient(0, 0, 0, 100);
  gradient.addColorStop(1, 'red');
  ctx.fillStyle = gradient;

  ctx.fill();

  var imageData = ctx.getImageData(1, 1, 98, 98);
  var imgdata = imageData.data;
  shouldBe(imgdata[4], 0);
  shouldBe(imgdata[5], 128);
  shouldBe(imgdata[6], 0);

  ctx.strokeStyle = 'green';
  ctx.lineWidth = 100;
  ctx.strokeRect(50, 0, 100, 100);

  ctx.strokeStyle = gradient;

  ctx.stroke();

  imageData = ctx.getImageData(1, 1, 98, 98);
  imgdata = imageData.data;
  shouldBe(imgdata[4], 0);
  shouldBe(imgdata[5], 128);
  shouldBe(imgdata[6], 0);
}
