/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test the default lineWidth is consistent.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas" width=600 height=300 style="border:5px solid black">
      ''', treeSanitizer: new NullTreeSanitizer());

  // Compare sections of a <canvas> to assert they are identical, or nearly so.
  compareRows(ctx, y0, y1, width, height, allowableDifference) {
    var data0 = ctx.getImageData(0, y0, width, height).data;
    var data1 = ctx.getImageData(0, y1, width, height).data;
    for (var i = 0, il = data0.length; i < il; ++i) {
      if (abs(data0[i] - data1[i]) > allowableDifference) {
        testFailed("Pixel at $i should be within $allowableDifference of ${data0[i]} but was ${data1[i]}");
        break;
      }
    }
  }

  var ctx = getContext2d("canvas");

  ctx.strokeStyle = 'blue';

  for (var j = 0; j < 3; ++j) {
    ctx.beginPath();
    for (var i = 0; i < 60; ++i) {
      var x = i * 10;
      var y = j * 100 + 30 + (i % 15);
      if (i == 0) {
        ctx.moveTo(x, y);
      } else {
        ctx.lineTo(x, y);
      }
    }
    ctx.stroke();

    if (j == 0) {
      shouldBe(ctx.lineWidth, 1);
      ctx.lineWidth = ctx.lineWidth;
      shouldBe(ctx.lineWidth, 1);
    } else {
      shouldBe(ctx.lineWidth, 1);
      ctx.lineWidth = 1;
      shouldBe(ctx.lineWidth, 1);
    }
  }

  // Make sure that all rows are nearly identical.
  // (Tiny variations are OK.)
  compareRows(ctx, 0, 100, 600, 100, 1);
  compareRows(ctx, 0, 200, 600, 100, 1);
}
