/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures that getImageData works correctly.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

var pass = testPassed;
var fail = testFailed;

// dart's setFillColorRgb expects r,g,b to be ints in the range [0,255]
setFillColor(ctx,r,g,b,a) =>
  ctx.setFillColorRgb(round(r*255), round(g*255), round(b*255), a);

main() {
  var canvas = document.createElement("canvas");
  canvas.width = 200;
  canvas.height = 200;
  var context = canvas.getContext("2d");

  dataToArray(data) {
    var result = new List(data.length);
    for (var i = 0; i < data.length; i++)
      result[i] = data[i];
    return result;
  }

  getPixel(ctx, x, y) {
    var data = ctx.getImageData(x,y,1,1);
    if (data == null) // getImageData failed, which should never happen
      return [-1,-1,-1,-1];
    return dataToArray(data.data);
  }

  pixelShouldBe(ctx, x, y, colour) {
    var ctxColour = getPixel(ctx, x, y);
    var correct = true;
    for (var i = 0; i < 4; i++)
      if (colour[i] != ctxColour[i]) {
        correct = false;
        break;
      }
    if (correct)
      pass("PASS: pixel at ${[x,y]} was $colour");
    else
      fail("FAIL: pixel at ${[x,y]} was $ctxColour, expected $colour");
  }

  // Check that getImageData is return the data for the right portion of the image
  for(var x = 0; x < 100; x+=4) {
    setFillColor(context, 0, x/96, 0, 1);
    context.fillRect(x,0,1,1);
    pixelShouldBe(context, x, 0, [0, round(255*x/96), 0, 255]);
  }

  // Check rgba ordering
  context.clearRect(0,0,100,100);
  setFillColor(context, 0.25, 0.5, 0.75, 1);
  context.fillRect(5,5,1,1);
  pixelShouldBe(context, 5, 5, [round(0.25*255), round(0.5*255), round(0.75*255), 255]);

  // Make sure we return correct values for the row
  for (var i = 0; i < 100; i++) {
    context.fillStyle = "rgba(0, $i, 0, 1)";
    context.fillRect(i, 10, 1, 1);
  }

  var rowImageData = context.getImageData(0, 10, 100, 1).data;
  var rowCheck = true;
  for (var i = 0; i < 100; i++) {
    if (rowImageData[i * 4 + 1] != i) {
      rowCheck = false;
      break;
    }
  }
  if (!rowCheck)
    fail("FAIL: Did not correctly retrieve every pixel in a row");
  else
    pass("PASS: Correctly retrieved every pixel in a row");

  // Check that we return transparent black for regions outside the canvas proper
  context.fillStyle = "rgba(255,255,255,255)";
  context.fillRect(198, 5, 4, 1); // final 2 pixels horizontally should be clipped
  var content = dataToArray(context.getImageData(198, 5, 4, 1).data);
  var expected = [255,255,255,255,255,255,255,255,
      0,0,0,0,0,0,0,0];
  var matched = true;
  for (var i = 0; i < 16; i++)
    if (content[i] != expected[i]) {
      matched = false;
      break;
    }
  if (matched)
    pass("PASS: Correct data for content outside canvas bounds");
  else
    fail("FAIL: Did not get correct data for content outside canvas bounds: $content");
}
