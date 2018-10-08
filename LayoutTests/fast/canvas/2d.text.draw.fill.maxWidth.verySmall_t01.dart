/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      @font-face {
        font-family: Ahem;
        src: url('$root/../../resources/Ahem.ttf');
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>On success, there should only be a green rectangle.</p>
      <canvas id="c" class="output" width="100" height="100"><p class="fallback">FAIL (fallback content)</p></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var ctx;

  drawCanvas(ctx) {
    ctx.fillStyle = '#0f0';
    ctx.fillRect(0,0,100,100);
    ctx.fillStyle = '#f00';
    ctx.fillText("XX", -10, 100, 10);
  }

  doDeferredTest() {
    drawCanvas(ctx);

    // Check that the letter rendered appropriately
    var renderedCorrectly = true;

    // Check that there is only a green rectangle
    var imageData = ctx.getImageData(50,50,1,1);
    if (imageData.data[0] != 0) renderedCorrectly = false;
    if (imageData.data[1] != 255) renderedCorrectly = false;
    if (imageData.data[2] != 0) renderedCorrectly = false;
    if (imageData.data[3] != 255) renderedCorrectly = false;

    shouldBeTrue(renderedCorrectly);
    asyncEnd();
  }

  dynamic canvas = document.getElementById('c');
  ctx = canvas.getContext("2d");
  ctx.font = "100px Ahem";

  // Kick off loading of the font
  ctx.fillText(" ", 0, 0);

  // Wait for the font to load, then run
  asyncStart();
  setTimeout(() {
    doDeferredTest();
  }, 50);
}
