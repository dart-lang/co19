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

main() {
  document.body.setInnerHtml('''
      <p>On success, the square should have the bottom left portion of the base of the green I and red otherwise.</p>
      <canvas id="c" class="output" width="100" height="100"><p class="fallback">FAIL (fallback content)</p></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  drawCanvas(ctx) {
    ctx.fillStyle = '#f00';
    ctx.fillRect(0,0,100,100);

    var gradient = ctx.createLinearGradient(0, 0, 100, 100);
    gradient.addColorStop(0, '#0f0');
    gradient.addColorStop(1, '#0f0');

    ctx.fillStyle = gradient;
    ctx.font = "500px Times";

    ctx.fillText("I", -5, 100);
  }

  var canvas = document.getElementById('c');
  var ctx = canvas.getContext("2d");
  drawCanvas(ctx);

  // Check that the letter rendered appropriately
  var renderedCorrectly = true;

  // Check for a green pixel from the text
  var imageData = ctx.getImageData(75,75,1,1);
  if (imageData.data[0] != 0) renderedCorrectly = false;
  if (imageData.data[1] != 255) renderedCorrectly = false;
  if (imageData.data[2] != 0) renderedCorrectly = false;
  if (imageData.data[3] != 255) renderedCorrectly = false;

  // Check the red pixel outside of text wasn't touched
  imageData = ctx.getImageData(25,25,1,1);
  if (imageData.data[0] != 255) renderedCorrectly = false;
  if (imageData.data[1] != 0) renderedCorrectly = false;
  if (imageData.data[2] != 0) renderedCorrectly = false;
  if (imageData.data[3] != 255) renderedCorrectly = false;

  shouldBeTrue(renderedCorrectly);
}
