/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the timestamps provided to requestAnimationFrame
 * callbacks advance
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  busyWait(millis) {
    var start = new DateTime.now();
    while (new DateTime.now().difference(start).inMilliseconds < millis) {}
  }

  asyncStart();

  var firstTimestamp;
  var secondTimestamp;

  window.requestAnimationFrame((timestamp) {
    firstTimestamp = timestamp;
    window.requestAnimationFrame((timestamp) {
      secondTimestamp = timestamp;
      shouldBeTrue(secondTimestamp > firstTimestamp);
      asyncEnd();
    });
    busyWait(10);
  });
}
