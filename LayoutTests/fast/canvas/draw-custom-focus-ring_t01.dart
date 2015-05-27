/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Canvas test: drawCustomFocusRing
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas" class="output" width="300" height="350">
          <button id="button1"></button>
          <button id="button2"></button>
      </canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.setAttribute("style", "padding: 0; margin: 0");

  var button1 = document.getElementById("button1");
  var button2 = document.getElementById("button2");

  var canvas = getContext2d("canvas");
  canvas.beginPath();
  canvas.rect(50, 50, 200, 100);
  canvas.fill();
  shouldBe(canvas.drawCustomFocusRing(button1), false);
  shouldBe(canvas.drawCustomFocusRing(button2), false);
  button1.focus();
  shouldBe(canvas.drawCustomFocusRing(button1), true);
}
