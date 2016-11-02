/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test window.dispatchEvent().
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  // Test that non-events throw
  var event = new Object();
  shouldThrow(() => window.dispatchEvent(event));

  // Test basic dispatch
  var myEventDispatched = false;
  var target;
  var currentTarget;
  window.addEventListener("myEvent", (evt) {
    myEventDispatched = true;
    target = evt.target;
    currentTarget = evt.currentTarget;
  }, false);
  event = new Event("myEvent", canBubble: false, cancelable: false);
  window.dispatchEvent(event);
  shouldBeTrue(myEventDispatched);
  shouldBe(target, window);
  shouldBe(currentTarget, window);

  // Test that both useCapture and non-useCapture listeners are dispatched to
  var useCaptureDispatched = false;
  window.addEventListener("myEvent", (evt) {
    useCaptureDispatched = true;
  }, true);
  var nonUseCaptureDispatched = false;
  window.addEventListener("myEvent", (evt) {
    nonUseCaptureDispatched = true;
  }, false);
  event = new Event("myEvent", canBubble: false, cancelable: false);
  window.dispatchEvent(event);
  shouldBeTrue(useCaptureDispatched);
  shouldBeTrue(nonUseCaptureDispatched);
}
