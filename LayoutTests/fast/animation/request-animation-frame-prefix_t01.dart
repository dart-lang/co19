/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the timestamps provided to prefixed
 * webkitRequestAnimationFrame callbacks
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var firstTimestamp;
  var secondTimestamp;
  var legacyFirstTimestamp;
  var legacySecondTimestamp;
  var deltaError;

  busyWait(millis) {
    var start = new DateTime.now();
    while (new DateTime.now().difference(start).inMilliseconds < millis) {}
  }

  asyncStart();

  window.requestAnimationFrame((timestamp) {
    firstTimestamp = timestamp;
  });

  //window.webkitRequestAnimationFrame((timestamp) {
  window.requestAnimationFrame((timestamp) {
    legacyFirstTimestamp = timestamp;

    window.requestAnimationFrame((timestamp) {
      secondTimestamp = timestamp;
    });

    //window.webkitRequestAnimationFrame((timestamp) {
    window.requestAnimationFrame((timestamp) {
      legacySecondTimestamp = timestamp;

      shouldBeGreaterThanOrEqual(legacyFirstTimestamp, firstTimestamp);
      shouldBeGreaterThanOrEqual(legacySecondTimestamp, secondTimestamp);
      deltaError = ((legacySecondTimestamp - legacyFirstTimestamp) - (secondTimestamp - firstTimestamp)).abs();
      shouldBeTrue(deltaError < 0.001);
      asyncEnd();
    });

    busyWait(10);
  });
}

