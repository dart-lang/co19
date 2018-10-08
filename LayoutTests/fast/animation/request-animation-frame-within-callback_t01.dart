/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests adding one callback within another
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  busyWait(millis) {
    var start = new DateTime.now();
    while (new DateTime.now().difference(start).inMilliseconds < millis) {}
  }

  asyncStart();

  var sameFrame;
  window.requestAnimationFrame((_) {
    sameFrame = true;
  });
  window.requestAnimationFrame((_) {
    window.requestAnimationFrame((_) {
      shouldBeFalse(sameFrame);
    });
    window.requestAnimationFrame((_) {
      asyncEnd();
    });
  });
  window.requestAnimationFrame((_) {
    sameFrame = false;
  });
}

