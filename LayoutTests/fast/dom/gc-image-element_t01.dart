/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for image elements firing their load events even when
 * they're not in the document.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  $(id)
  {
    return document.getElementById(id);
  }

  var imageCount = 0;

  createImage()
  {
    ++imageCount;
    var image = new ImageElement();
    image.src = "$root/resources/apple.gif";
    image.onLoad.listen((_) {
      --imageCount;
      if (imageCount != 0)
        return;
      asyncEnd();
    });
  }

  asyncStart();
  var image = new ImageElement();
  image.src = "$root/resources/apple.gif";
  image.onLoad.listen((_) { // Wait for the image to load so subsequent loads will be synchronous.
    for (var i = 0; i < 10; ++i)
      createImage();
    gc();
  });
}
