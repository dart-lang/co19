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
      <canvas id="c1" width="32px" height="32px"></canvas>
      <canvas id="c2" width="32px" height="32px"></canvas>
      <a>This test exercises a webkit specific canvas routine drawImageFromRect. This test should pass and never crash. <rdar://problem/9125032> </a>
      <a id="result"></a>
      ''', treeSanitizer: new NullTreeSanitizer());

  init() {
    dynamic imgCanvas = document.getElementById("c1");
    dynamic imgCanvas2 = document.getElementById("c2");

    var imgCtx = imgCanvas.getContext("2d");
    var imgCtx2 = imgCanvas2.getContext("2d");
    imgCtx.fillStyle = '#0f0';
    imgCtx.fillRect(0,0,32,32);

    var newImage =  new ImageElement();
    newImage.src = imgCanvas.toDataUrl();

    imgCtx2.fillStyle = '#0f0';
    imgCtx2.fillRect(0,0,32,32);
    imgCtx2.drawImageToRect(newImage,
        new Rectangle(0, 0, 32, 32),
        sourceRect: new Rectangle(0, 1, 1, 1));

    dynamic result = document.getElementById("result");
    var data = imgCtx2.getImageData(0,0,1,1).data;
    var red = data[0];
    var green = data[1];
    var blue = data[2];
    var alpha = data[3];
    if (red != 0 || green != 255 || blue != 0 || alpha != 255)
      result.innerHtmL = "FAIL";
    else
      result.innerHtml = "PASS";
  }
  init();
}
