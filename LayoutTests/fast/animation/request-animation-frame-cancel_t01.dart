/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests cancelling a requestAnimationFrame callback
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var callbackFired = false;

  var id = window.requestAnimationFrame((_) {
    callbackFired = true;
  });

  window.cancelAnimationFrame(id);

  asyncStart();

  window.requestAnimationFrame((_) {
    shouldBeFalse(callbackFired);
    asyncEnd();
  });
}

