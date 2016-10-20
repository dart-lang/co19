/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Canvas test: test large width/height values
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>Tests that using reasonably large values for canvas.height and canvas.height don't cause a crash"</p>
      <pre id="console"></pre>
      <canvas id="c" class="output" width="100" height="50"><p class="fallback">FAIL (fallback content)</p></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("c");
  var x, y, w=1, h=1;

  testHeight(canvas, height) {
    canvas.width = 50;
    canvas.height = height;
    var ctx = canvas.getContext("2d");
    ctx.fillStyle = "rgba(255, 255, 255, 1)";
    debug("testHeight height");
    shouldBe(canvas.height, height);
    x = canvas.width-2;
    y = canvas.height-2;
    ctx.fillRect(x,y,w,h);
    var data = ctx.getImageData(x,y,w,h);
    for (var x = 0; x < 4; x++) {
      debug("testHeight data.data[$x]");
      shouldBe(data.data[x], 255);
    }
  }

  testWidth(canvas, width) {
    canvas.height = 50;
    canvas.width = width;
    var ctx = canvas.getContext("2d");
    ctx.fillStyle = "rgba(255, 255, 255, 1)";
    debug("testWidth width");
    shouldBe(canvas.width, width);
    x = canvas.width-2;
    y = canvas.height-2;
    ctx.fillRect(x,y,w,h);
    var data = ctx.getImageData(x,y,w,h);
    for (var x = 0; x < 4; x++) {
      debug("testWidth data.data[$x]");
      shouldBe(data.data[x], 255);
    }
  }

  testHeight(canvas, 1000);
  testHeight(canvas, 10000);
  testHeight(canvas, 32000);

  testWidth(canvas, 1000);
  testWidth(canvas, 10000);
  testWidth(canvas, 32000);
}
