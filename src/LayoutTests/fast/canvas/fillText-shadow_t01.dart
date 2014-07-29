/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that (vertical) shadow offsets are applied correctly when
 * using fillText() regardless of blur amount.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <canvas width="600" height="300" style="border: solid 1px gray"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  CanvasElement canvas = document.query('canvas');
  var ctx = canvas.getContext('2d');
  ctx.font = 'bold 128px sans-serif';
  ctx.shadowColor = 'red';
  ctx.shadowOffsetY = 100;

  testWithBlur(blur, belowOffset) {
    ctx.clearRect(0, 0, 600, 300);
    ctx.shadowBlur = blur;

    // Center the I around the Y axis.
    ctx.fillText('I', -ctx.measureText('I').width/2, 128);

    debug('Testing with blur of $blur pixels');

    // Make sure that the shadow doesn't end up above the text...
    var imageData = ctx.getImageData(0, 0, 1, 1);
    var imgdata = imageData.data;

    shouldBe(imgdata[0], 0);
    shouldBe(imgdata[1], 0);
    shouldBe(imgdata[2], 0);
    shouldBe(imgdata[3], 0);

    // ...but below.
    imageData = ctx.getImageData(0, belowOffset, 1, 1);
    imgdata = imageData.data;  
    shouldBe(imgdata[0], 255);
    shouldBe(imgdata[1], 0);
    shouldBe(imgdata[2], 0);
    shouldBe(imgdata[3], 255);
  }

  debug('Testing with no transform');
  testWithBlur(0, 150);
  testWithBlur(1, 150);
  testWithBlur(5, 150);

  debug('Testing with scale transform');
  ctx.scale(1, 2);
  testWithBlur(0, 299);
  testWithBlur(1, 299);
  testWithBlur(5, 299);
}
