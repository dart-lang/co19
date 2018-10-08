/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests one requestAnimationFrame callback cancelling a second
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var secondCallbackId;
  var callbackFired = false;
  var cancelFired = false;

  window.requestAnimationFrame((_) {
    cancelFired = true;
    window.cancelAnimationFrame(secondCallbackId);
  });

  secondCallbackId = window.requestAnimationFrame((_) {
    callbackFired = true;
  });

  asyncStart();
  window.requestAnimationFrame((_) {
    shouldBeFalse(callbackFired);
    shouldBeTrue(cancelFired);
    asyncEnd();
  });
}
