/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test covers the behaviour of pattern use and construction
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var context;

  dataToArray(data) {
    var result = new List(data.length);
    for (var i = 0; i < data.length; i++)
      result[i] = data[i];
    return result;
  }

  getPixel(x, y) {
    var data = context.getImageData(x,y,1,1);
    if (data == null) // getImageData failed, which should never happen
      return [-1,-1,-1,-1];
    return dataToArray(data.data);
  }

  pixelShouldBe(x, y, colour) {
    shouldBeList(getPixel(x, y), colour);
  }

  createCanvasImage(width, height, colour) {
    dynamic c = document.createElement("canvas");
    c.width = width;
    c.height = height;
    var context = c.getContext("2d");
    context.fillStyle = colour;
    context.fillRect(0,0,width,height);
    return c;
  }

  var green1x1 = createCanvasImage(1, 1, "green");
  var green100x50 = createCanvasImage(100, 50, "green");

  dynamic canvas = document.createElement("canvas");
  canvas.width = 100;
  canvas.height = 50;
  context = canvas.getContext("2d");
  var tests = [
    () {
      var didThrow = false;
      var pattern;
      try {
        pattern = context.createPattern(green1x1, null);
      } catch (e) {
        didThrow = true;
        testFailed("context.createPattern(green1x1, null) threw exception $e");
      }
      if (!didThrow)
        testPassed("context.createPattern(green1x1, null) did not throw an exception");

      context.fillStyle = pattern;
      context.fillRect(0, 0, 100, 50);
      pixelShouldBe(1,   1, [0,128,0,255]);
      pixelShouldBe(98,  1, [0,128,0,255]);
      pixelShouldBe(1,  48, [0,128,0,255]);
      pixelShouldBe(98, 48, [0,128,0,255]);
    },
    () {
      shouldThrow(() => context.createPattern(green1x1, 'null'));
    },
    () {
      var didThrow = false;
      var pattern;
      try {
        pattern = context.createPattern(green1x1, '');
      } catch (e) {
        didThrow = true;
        testFailed("context.createPattern(green1x1, '') threw exception $e");
      }
      if (!didThrow)
        testPassed("context.createPattern(green1x1, '') did not throw an exception");

      context.fillStyle = pattern;
      context.fillRect(0, 0, 100, 50);
      pixelShouldBe(1,   1, [0,128,0,255]);
      pixelShouldBe(98,  1, [0,128,0,255]);
      pixelShouldBe(1,  48, [0,128,0,255]);
      pixelShouldBe(98, 48, [0,128,0,255]);
    },
    () {
      var didThrow = false;
      var pattern;
      try {
        pattern = context.createPattern(green1x1, 'repeat');
      } catch (e) {
        didThrow = true;
        testFailed("context.createPattern(green1x1, 'repeat') threw exception $e");
      }
      if (!didThrow)
        testPassed("context.createPattern(green1x1, 'repeat') did not throw an exception");

      context.fillStyle = pattern;
      context.fillRect(0, 0, 100, 50);
      pixelShouldBe(1,   1, [0,128,0,255]);
      pixelShouldBe(98,  1, [0,128,0,255]);
      pixelShouldBe(1,  48, [0,128,0,255]);
      pixelShouldBe(98, 48, [0,128,0,255]);
    },
    () {
      context.fillStyle = "green";
      context.fillRect(0, 0, 50, 50);
      var pattern = context.createPattern(green100x50, "no-repeat");
      context.fillStyle = pattern;
      context.translate(50, 0);
      context.fillRect(-50, 0, 100, 50);
      pixelShouldBe(1,   1, [0,128,0,255]);
      pixelShouldBe(98,  1, [0,128,0,255]);
      pixelShouldBe(1,  48, [0,128,0,255]);
      pixelShouldBe(98, 48, [0,128,0,255]);
    },
    ];
  for (var i = 0; i < tests.length; i++) {
    debug('test ${i+1}');
    context.fillStyle="red";
    context.fillRect(0,0,100,50);
    tests[i]();
  }
}
