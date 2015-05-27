/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests for canvas alpha
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas1" width="8" height="8"></canvas>
      <canvas id="canvas2" width="8" height="8"></canvas>
      <canvas id="canvas3" width="8" height="8"></canvas>
      <canvas id="canvas4" width="8" height="8"></canvas>
      ''', treeSanitizer: new NullTreeSanitizer());

  var canvas1 = document.getElementById("canvas1");
  var canvas2 = document.getElementById("canvas2");
  var canvas3 = document.getElementById("canvas3");
  var canvas4 = document.getElementById("canvas4");

  var ctx1 = canvas1.getContext("2d");
  var ctx2 = canvas2.getContext("2d", {} );
  var ctx3 = canvas3.getContext("2d", { 'alpha': false } );
  var ctx4 = canvas4.getContext("2d", { 'alpha': true } );

  shouldBe(ctx1.getContextAttributes().alpha, true);
  var imgData1 = ctx1.getImageData(0, 0, 1, 1);
  shouldBe(imgData1.data[0], 0);
  shouldBe(imgData1.data[1], 0);
  shouldBe(imgData1.data[2], 0);
  shouldBe(imgData1.data[3], 0);

  shouldBe(ctx2.getContextAttributes().alpha, true);
  var imgData2 = ctx2.getImageData(0, 0, 1, 1);
  shouldBe(imgData2.data[0], 0);
  shouldBe(imgData2.data[1], 0);
  shouldBe(imgData2.data[2], 0);
  shouldBe(imgData2.data[3], 0);

  shouldBe(ctx3.getContextAttributes().alpha, false);

  shouldBe(ctx4.getContextAttributes().alpha, true);
  var imgData4 = ctx4.getImageData(0, 0, 1, 1);
  shouldBe(imgData4.data[0], 0);
  shouldBe(imgData4.data[1], 0);
  shouldBe(imgData4.data[2], 0);
  shouldBe(imgData4.data[3], 0);

  // Check that mutating the returned value of getContextAttributes() doesn't
  // affect the existing canvas, or the values of subsequent calls to
  // getContextAttributes().
  var attrs = ctx4.getContextAttributes();
  shouldBe(attrs.alpha, true);
  attrs.alpha = false;
  imgData4 = ctx4.getImageData(0, 0, 1, 1);
  shouldBe(ctx4.getContextAttributes().alpha, true);
  shouldBe(imgData4.data[0], 0);
  shouldBe(imgData4.data[1], 0);
  shouldBe(imgData4.data[2], 0);
  shouldBe(imgData4.data[3], 0);
}
