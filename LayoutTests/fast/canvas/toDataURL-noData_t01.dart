/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="zero-Zero" width="0" height="0"></canvas>
      <canvas id="zero-oneHundred" width="0" height="100"></canvas>
      <canvas id="oneHundred-zero" width="100" height="0"></canvas>
      <pre id='console'></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  testMIMEType(canvas, description)
  {
    var ctx = canvas.getContext("2d");

    // draw into canvas
    ctx.fillStyle = "rgb(200,0,0)";
    ctx.fillRect(10, 10, 55, 50);
    ctx.fillStyle = "rgba(0, 0, 200, 0.5)";
    ctx.fillRect(30, 30, 55, 50);

    var dataURL = canvas.toDataUrl();

    shouldBe(dataURL, "data:,");
  }

  testToDataURL()
  {
    testMIMEType(document.getElementById("zero-Zero"), "0x0");
    testMIMEType(document.getElementById("zero-oneHundred"), "0x100");
    testMIMEType(document.getElementById("oneHundred-zero"), "100x0");
  }

  testToDataURL();
}
