/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 * @note no Window.createImageBitmap (yet?)
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var canvas = document.createElement("canvas");
  canvas.width = 200;
  canvas.height = 200;
  var ctx = canvas.getContext("2d");

  shouldBeGreen(x, y) {
    var d = ctx.getImageData(x, y, 1, 1).data;
    shouldBeTrue(d[0] == 0);
    shouldBeTrue(d[1] == 255);
    shouldBeTrue(d[2] == 0);
    shouldBeTrue(d[3] == 255);
  }

  var img;
  imageLoaded(_) {
    // The gif switches from green to red in 10ms. We wait 50ms to ensure that the gif will have changed colors.
    // If the ImageBitmap is green, we know that it is a snapshot of the gif's 0th frame.
    setTimeout(() {
      window.createImageBitmap(img).then((imageBitmap) {
        ctx.drawImage(imageBitmap, 0, 0);
        shouldBeGreen(100, 100);
        asyncEnd();
      }, () {
        testFailed("Promise was rejected.");
        asyncEnd();
      });
    }, 50);
  }

  //asyncStart();
  img = new ImageElement();
  img.src = '$root/resources/green-red-animated.gif';
  //img.onLoad.listen(imageLoaded);
}
