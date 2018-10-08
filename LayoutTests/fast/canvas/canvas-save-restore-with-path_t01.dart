/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures that paths are correctly handled over
 * save/restore boundaries
 */
import "dart:html";
import "dart:math" as Math;
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

  dynamic canvas = document.createElement("canvas");
  canvas.width = 100;
  canvas.height = 100;

  context = canvas.getContext("2d");
  context.fillStyle = "red";
  context.fillRect(0,0,100,100);
  context.fillStyle = "green";

  // Test translate
  context.beginPath();
  context.save();
  context.translate(100, 100);
  context.rect(-100, -100, 50, 50);
  context.restore();
  context.fill();
  pixelShouldBe(25, 25, [0, 128, 0, 255]);

  // Test scale
  context.beginPath();
  context.save();
  context.scale(2, 2);
  context.rect(25, 0,25,25);
  context.restore();
  context.fill();
  pixelShouldBe(75, 25, [0, 128, 0, 255]);
  pixelShouldBe(75, 75, [255, 0, 0, 255]);

  // Test rotate
  context.beginPath();
  context.save();
  context.rotate(90/180 * Math.pi);
  context.rect(50, -50, 50, 50);
  context.restore();
  context.fill();
  pixelShouldBe(25, 75, [0, 128, 0, 255]);
  pixelShouldBe(75, 75, [255, 0, 0, 255]);

  // Test transform
  context.beginPath();
  context.save();
  context.transform(1, 0, 0, 1, 50, 50);
  context.rect(0, 0, 50, 50);
  context.restore();
  context.fill();
  pixelShouldBe(75, 75, [0, 128, 0, 255]);
}
