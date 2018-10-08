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
import "../../resources/run-after-display.dart";

main() {
  var style = new Element.html('''
      <style>
        canvas {
          width:600px;
          height:500px;
          border:2px solid black;
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <canvas id="canvas"></canvas>
      ''', treeSanitizer: new NullTreeSanitizer());

  repaintTest()
  {
    dynamic canvas = document.getElementById("canvas");
    var ctx = canvas.getContext("2d");

    ctx.fillStyle = "rgb(200,0,0)";
    ctx.fillRect (10, 10, 100, 100);

    ctx.fillStyle = "rgba(0, 0, 200, 0.5)";
    ctx.fillRect (50, 50, 100, 100);
    asyncEnd();
  }

  asyncStart();
  runAfterDisplay(repaintTest);
}
