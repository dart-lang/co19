/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Bug 105650: Test correct rendering of quadratic and bezier
 * curves with coincident endpoints
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas" width="100" height="100"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic ctx = getContext2d("canvas");

  shouldBeYellow(x,y)
  {
    var blue_value = ctx.getImageData(x, y, 1, 1).data[2];
    shouldBe(blue_value, 0);
  }

  shouldBeBlue(x,y)
  {
    var blue_value = ctx.getImageData(x, y, 1, 1).data[2];
    shouldBe(blue_value, 255);
  }

  ctx.fillStyle = '#00f';
  ctx.strokeStyle = '#ff0';
  ctx.lineWidth = 30;

  ctx.beginPath();
  ctx.fillRect(0,0,100,100);

  // quadratic with coincident endpoint
  ctx.moveTo(20,20);

  //Next line should be close to ctx.bezierCurveTo(81,80,80,80,20,20);
  ctx.quadraticCurveTo(110,110,20,20);

  shouldBeBlue(70,70);
  ctx.stroke();
  shouldBeYellow(70,70);
}
