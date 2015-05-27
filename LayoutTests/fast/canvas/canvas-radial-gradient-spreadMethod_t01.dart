/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure correct behaviour of spreadMethod to
 * a radial gradient.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var ctx = createContext2d("canvas");

  var radgrad = ctx.createRadialGradient(80,90,90,80,50,100);
  radgrad.addColorStop(0, 'green');
  radgrad.addColorStop(1, 'green');

  ctx.fillStyle = radgrad;
  ctx.fillRect(0, 0, 100, 100);
  var imageData = ctx.getImageData(0, 0, 100, 100);
  var imgdata = imageData.data;
  shouldBe(imgdata[4], 0);
  shouldBe(imgdata[5], 128);
  shouldBe(imgdata[6], 0);
  shouldBe(imgdata[7], 255);
}
