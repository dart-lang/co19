/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Canvas test: drawFocusIfNeeded
 * @note no (yet?) drawFocusIfNeeded
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";

main() {
  /*
  document.body.setInnerHtml('''
      <canvas id="canvas" class="output" width="300" height="350">
          <button id="button1"></button>
          <button id="button2"></button>
      </canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.setAttribute("style", "padding: 0; margin: 0");

  var canvas = getContext2d("canvas");

  document.getElementById("button1").addEventListener('focus', (_) {
    canvas.beginPath();
    canvas.rect(50, 50, 200, 100);
    canvas.fillStyle = "#ccf";
    canvas.fill();
    canvas.drawFocusIfNeeded(document.getElementById("button1"));

    canvas.beginPath();
    canvas.rect(50, 200, 200, 100);
    canvas.fillStyle = "#cfc";
    canvas.fill();
    canvas.drawFocusIfNeeded(document.getElementById("button2"));
  });

  document.getElementById("button1").focus();

  // The top rect's focus ring is tied to button1, which is focused.
  // It should have an outline in some color other than the background color.
  var imageData = canvas.getImageData(49, 50, 1, 1);
  var data = imageData.data;
  shouldBe(data[0] != 0 || data[1] != 0 || data[2] != 0, true);

  // The bottom rect"s focus ring is tied to button2, which is not focused.
  imageData = canvas.getImageData(49, 200, 1, 1);
  data = imageData.data;
  shouldBe(data[0] == 0 && data[1] == 0 && data[2] == 0, true);
  */
}
