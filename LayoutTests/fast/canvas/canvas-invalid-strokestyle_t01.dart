/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure correct behaviour on an invalid
 * strokeStyle()
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas" width="200" height="200"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic ctx = getContext2d("canvas");
  ctx.strokeStyle = 'rgb(0, 255, 0)';
  ctx.strokeStyle = 'nonsense';
  ctx.lineWidth = 200;
  ctx.moveTo(0,100);
  ctx.lineTo(200,100);
  ctx.stroke();
  var imageData = ctx.getImageData(0, 0, 200, 200);
  var imgdata = imageData.data;
  shouldBe(imgdata[4], 0);
  shouldBe(imgdata[5], 255);
  shouldBe(imgdata[6], 0);
}
