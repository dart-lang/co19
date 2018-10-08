/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks behavior of valid arguments to
 * Canvas::drawImage that use a valid source image.
 * @note no Window.createImageBitmap (yet?)
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var myImage, bitmap;
  dynamic ctx;

  drawBitmap(imageBitmap) {
    bitmap = imageBitmap;

    // bitmap argument plus 2 numbers
    shouldNotThrow(() => ctx.drawImage(bitmap, 0, 0));

    // bitmap argument plus 4 numbers
    shouldNotThrow(() => ctx.drawImage(bitmap, 0, 0, 20, 20));

    // bitmap argument plus 8 numbers
    shouldNotThrow(() => ctx.drawImage(bitmap, 0, 0, 20, 20, 0, 0, 20, 20));

    // bitmap argument plus zero size
    shouldNotThrow(() => ctx.drawImage(bitmap, 0, 0, 0, 0));

    // bitmap argument plus 8 numbers, zero size
    shouldNotThrow(() => ctx.drawImage(bitmap, 0, 0, 20, 20, 0, 0, 0, 0));

    // bitmap argument plus 8 numbers, negative size of source, zero size
    shouldNotThrow(() => ctx.drawImage(bitmap, 20, 20, -20, 0, 0, 0, 20, 20));

    // bitmap argument plus 8 numbers, negative size of destination, zero size
    shouldNotThrow(() => ctx.drawImage(bitmap, 0, 0, 20, 0, 20, 20, -20, -20));

    // bitmap argument plus 8 numbers, negative size of source and destination, zero size
    shouldNotThrow(() => ctx.drawImage(bitmap, 20, 20, -20, 0, 20, 20, -20, -20));

    // imageRect does not contain sourceRect on the left side
    shouldNotThrow(() => ctx.drawImage(bitmap, -10, 0, 52, 64, 0, 0, 20, 20));

    // imageRect does not contain sourceRect on the right side
    shouldNotThrow(() => ctx.drawImage(bitmap, 10, 0, 52, 64, 0, 0, 20, 20));

    // imageRect does not contain sourceRect on top
    shouldNotThrow(() => ctx.drawImage(bitmap, 0, -10, 52, 64, 0, 0, 20, 20));

    // imageRect does not contain sourceRect on bottom
    shouldNotThrow(() => ctx.drawImage(bitmap, 0, 10, 52, 64, 0, 0, 20, 20));

    // sourceRect is bigger than imageSource on every side
    shouldNotThrow(() => ctx.drawImage(bitmap, -10, -10, 72, 84, 0, 0, 20, 20));

    // negative size of source, imageRect does not contain sourceRect on the left side
    shouldNotThrow(() => ctx.drawImage(bitmap, 42, 64, -52, -64, 0, 0, 20, 20));

    // negative size of source, imageRect does not contain sourceRect on the right side
    shouldNotThrow(() => ctx.drawImage(bitmap, 62, 64, -52, -64, 0, 0, 20, 20));

    // negative size of source, imageRect does not contain sourceRect on top
    shouldNotThrow(() => ctx.drawImage(bitmap, 52, 54, -52, -64, 0, 0, 20, 20));

    // negative size of source, imageRect does not contain sourceRect on bottom
    shouldNotThrow(() => ctx.drawImage(bitmap, 52, 74, -52, -64, 0, 0, 20, 20));

    // negative size of source, imageRect does not contain sourceRect on every side
    shouldNotThrow(() => ctx.drawImage(bitmap, 62, 74, -72, -84, 0, 0, 20, 20));

    asyncEnd();
  }

  draw(_) {
    // No arguments should get exception
    shouldThrow(() => ctx.drawImage());

    // image argument only should get exception
    shouldThrow(() => ctx.drawImage(myImage));

    // image argument plus one number should get exception
    shouldThrow(() => ctx.drawImage(myImage, 0));

    // image argument plus 2 numbers
    shouldNotThrow(() => ctx.drawImage(myImage, 0, 0));

    // image argument plus 4 numbers
    shouldNotThrow(() => ctx.drawImageScaled(myImage, 0, 0, 20, 20));

    // image argument plus 8 numbers
    shouldNotThrow(() => ctx.drawImageScaledFromSource(myImage, 0, 0, 20, 20, 0, 0, 20, 20));

    // image argument plus zero size
    shouldNotThrow(() => ctx.drawImageScaled(myImage, 0, 0, 0, 0));

    // image argument plus 8 numbers, zero size
    shouldNotThrow(() => ctx.drawImageScaledFromSource(myImage, 0, 0, 20, 20, 0, 0, 0, 0));

    // imageRect does not contain sourceRect on the left side
    shouldNotThrow(() => ctx.drawImageScaledFromSource(myImage, -10, 0, 52, 64, 0, 0, 20, 20));

    // imageRect does not contain sourceRect on the right side
    shouldNotThrow(() => ctx.drawImageScaledFromSource(myImage, 10, 0, 52, 64, 0, 0, 20, 20));

    // imageRect does not contain sourceRect on top
    shouldNotThrow(() => ctx.drawImageScaledFromSource(myImage, 0, -10, 52, 64, 0, 0, 20, 20));

    // imageRect does not contain sourceRect on bottom
    shouldNotThrow(() => ctx.drawImageScaledFromSource(myImage, 0, 10, 52, 64, 0, 0, 20, 20));

    // sourceRect is bigger than imageSource on every side
    shouldNotThrow(() => ctx.drawImageScaledFromSource(myImage, -10, -10, 72, 84, 0, 0, 20, 20));

    // negative size of source, imageRect does not contain sourceRect on the left side
    shouldNotThrow(() => ctx.drawImageScaledFromSource(myImage, 42, 64, -52, -64, 0, 0, 20, 20));

    // negative size of source, imageRect does not contain sourceRect on the right side
    shouldNotThrow(() => ctx.drawImageScaledFromSource(myImage, 62, 64, -52, -64, 0, 0, 20, 20));

    // negative size of source, imageRect does not contain sourceRect on top
    shouldNotThrow(() => ctx.drawImageScaledFromSource(myImage, 52, 54, -52, -64, 0, 0, 20, 20));

    // negative size of source, imageRect does not contain sourceRect on bottom
    shouldNotThrow(() => ctx.drawImageScaledFromSource(myImage, 52, 74, -52, -64, 0, 0, 20, 20));

    // negative size of source, imageRect does not contain sourceRect on every side
    shouldNotThrow(() => ctx.drawImageScaledFromSource(myImage, 62, 74, -72, -84, 0, 0, 20, 20));

    // images with no src can be drawn
    shouldNotThrow(() => ctx.drawImage(new ImageElement(), 0, 0));
    shouldNotThrow(() => ctx.drawImageScaled(new ImageElement(), 0, 0, 20, 20));
    shouldNotThrow(() => ctx.drawImageScaledFromSource(new ImageElement(), 0, 0, 20, 20, 0, 0, 20, 20));

    // images with no src exit early before IndexSizeError is thrown
    shouldNotThrow(() => ctx.drawImage(new ImageElement(), 0, 0));
    shouldNotThrow(() => ctx.drawImageScaled(new ImageElement(), 0, 0, 0, 20));
    shouldNotThrow(() => ctx.drawImageScaledFromSource(new ImageElement(), 0, 0, 0, 20, 0, 0, 20, 20));

    /*window.createImageBitmap(myImage).then(drawBitmap, () {
      testFailed("Promise was rejected.");
      asyncEnd();
    });*/
    asyncEnd();
  }

  asyncStart();
  // Create image
  myImage = new ImageElement();
  var img_src = '$root/resources/apple.gif';
  myImage.src = img_src;
  myImage.onLoad.listen(draw);

  ctx = createContext2d("canvas");
}
