/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test to ensure that removeEventListener works.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var count = 0;
  eventHandler(event) {
    ++count;
  }

  var event = new Event("foo", canBubble: true, cancelable: false);
  window.addEventListener("foo", eventHandler, false);
  document.dispatchEvent(event);
  window.removeEventListener("foo", eventHandler, false);
  document.dispatchEvent(event);

  shouldBe(count, 1);
}
