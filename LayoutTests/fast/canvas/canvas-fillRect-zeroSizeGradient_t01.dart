/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure that fillRect() paints nothing on
 * canvas when the fillStyle is set to a zero-size gradient.
 */
import "../../testcommon.dart";

main() {
  dynamic ctx = createContext2d("canvas");

  ctx.fillStyle = '#0f0';
  ctx.fillRect(0, 0, 1, 1);

  var g = ctx.createLinearGradient(0, 0, 0, 0); // zero-length line (undefined direction);
  g.addColorStop(0, '#f00');
  g.addColorStop(1, '#f00');
  ctx.fillStyle = g;
  ctx.fillRect(0, 0, 1 ,1);

  var imageData = ctx.getImageData(0, 0, 1, 1);
  var imgdata = imageData.data;
  shouldBe(imgdata[0], 0);
  shouldBe(imgdata[1], 255);
  shouldBe(imgdata[2], 0);
}
