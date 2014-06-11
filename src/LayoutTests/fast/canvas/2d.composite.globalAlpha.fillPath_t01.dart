/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description The test to ensure correct sync behaviour with globalAlpha and
 * fillPath() in accelerated-2d-canvas mode.
 */
import "dart:html";
import 'dart:math' as math;
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <!-- Test based on that found at
           http://http://philip.html5.org/tests/canvas/suite/tests/index.2d.composite.globalAlpha.html
        -->
      <canvas id="canvas" width="100" height="100"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  abs(x) => x.abs();
  max(list) => list.reduce(math.max);

  assertPixelApprox(ctx, x,y, r,g,b,a, pos, colour, tolerance)
  {
    var imgdata = ctx.getImageData(x, y, 1, 1);
    var diff = max([abs(r-imgdata.data[0]), abs(g-imgdata.data[1]),
                    abs(b-imgdata.data[2]), abs(a-imgdata.data[3])]);
    shouldBeFalse(diff > tolerance);
  }

  var ctx = document.getElementById('canvas').getContext('2d');

  ctx.fillStyle = '#0f0';
  ctx.fillRect(0, 0, 100, 100);
  ctx.globalAlpha = 0.01; // avoid any potential alpha=0 optimisations
  ctx.beginPath();
  ctx.fillStyle = '#f00';
  ctx.rect(0, 0, 100, 100);
  ctx.fill();
  assertPixelApprox(ctx, 50,25, 2,253,0,255, "50,25", "2,253,0,255", 2);
}
