/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures that Canvas and CanvasRenderingContext2D work
 * correctly if the rendering context outlives the canvas element
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

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

  prepareCanvas() {
    var context = document.createElement("canvas").getContext("2d");
    context.fillStyle = "green";
    context.fillRect(0,0,100,100);
    return context;
  }

  test() {
    context = prepareCanvas();
    gc();
    pixelShouldBe(50, 50, [0, 128, 0, 255]);
  }
  test();
}

