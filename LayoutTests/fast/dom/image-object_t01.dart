/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that the ImageElement object works as expected.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var i1, i2;

  imageLoaded(_) {
    if (!i2.complete) {
      testFailed('FAILURE: image loaded but complete is false!');
    }

    if (i2.width != 52) {
      testFailed('FAILURE: image width should be 52, was ' + i2.width);
    }

    if (i2.height != 64) {
      testFailed('FAILURE: image width should be 64, was ' + i2.height);
    }
    asyncEnd();
  }

  i1 = new ImageElement();
  if (!i1.complete) {
    testFailed('FAILURE: Empty image should have complete set to true.');
  }

  asyncStart();

  i2 = new ImageElement();
  i2.onLoad.listen(imageLoaded);
  i2.src = '$root/resources/apple.gif';
}
