/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks behavior of Canvas::drawImage with a broken
 * source image.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  dynamic ctx;
  var invalidImage;

  draw(_) {
    // null images should throw TypeError
    shouldThrow(() => ctx.drawImage(null, 0, 0));
    shouldThrow(() => ctx.drawImageScaled(null, 0, 0, 20, 20));
    shouldThrow(() => ctx. drawImageScaledFromSource(null, 0, 0, 20, 20, 0, 0, 20, 20));

    // broken images should not throw
    shouldThrow(() => ctx.drawImage(invalidImage, 0, 0));
    shouldThrow(() => ctx.drawImageScaled(invalidImage, 0, 0, 20, 20));
    shouldThrow(() => ctx.drawImageScaledFromSource(invalidImage, 0, 0, 20, 20, 0, 0, 20, 20));
    shouldThrow(() => ctx.drawImageScaled(invalidImage, 0, 0, 0, 20));
    shouldThrow(() => ctx.drawImageScaledFromSource(invalidImage, 0, 0, 0, 20, 0, 0, 20, 20));

    asyncEnd();
  }

  asyncStart();

  // Create an image with invalid data.
  invalidImage = new ImageElement();
  invalidImage.onError.listen(draw);
  invalidImage.src = '$root/drawImage-with-broken-image_t01.dart';

  ctx = createContext2d("canvas");
}
