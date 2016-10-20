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

  var ctx = getContext2d("canvas");

  shouldBeYellow(x,y)
  {
    var value = ctx.getImageData(x, y, 1, 1).data[2];
    shouldBe(value, 0);
  }

  shouldBeBlue(x,y)
  {
    var value = ctx.getImageData(x, y, 1, 1).data[2];
    shouldBe(value, 255);
  }

  ctx.fillStyle = '#00f';
  ctx.strokeStyle = '#ff0';
  ctx.lineWidth = 30;

  ctx.beginPath();
  ctx.fillRect(0,0,100,100);
  ctx.moveTo(0,0);

  // bezier curve with coincident endpoints, horizontal line
  ctx.bezierCurveTo(0,0,200,0,0,0);
  shouldBeBlue(50,0);
  ctx.stroke();
  shouldBeYellow(50,0);
  shouldBeBlue(0,50);
  shouldBeBlue(70,70);

  // bezier curve with coincident endpoints, vertical line
  ctx.bezierCurveTo(0,200,0,0,0,0);
  ctx.stroke();
  shouldBeYellow(50,0);
  shouldBeBlue(75,75);

  // bezier curve with coincident endpoints
  ctx.bezierCurveTo(200,0,0,200,0,0);
  ctx.stroke();
  shouldBeYellow(75,75);
}
