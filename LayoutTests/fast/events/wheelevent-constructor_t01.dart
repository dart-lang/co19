/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the constructor of the standard wheel event
 * href="http://www.w3.org/TR/DOM-Level-3-Events/#events-WheelEvent"
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var testEvent = new WheelEvent('wheel');
  shouldBeTrue(testEvent is WheelEvent);
  shouldBe(testEvent.deltaX, 0);
  shouldBe(testEvent.deltaY, 0);
  shouldBe(testEvent.deltaZ, 0);
  shouldBe(testEvent.deltaMode, WheelEvent.DOM_DELTA_PIXEL);

  testEvent = new WheelEvent('wheel', deltaX: 10.2, deltaY: 20.3, deltaZ: 30.4,
      deltaMode: WheelEvent.DOM_DELTA_PAGE);
  shouldBeTrue(testEvent is WheelEvent);
  shouldBe(testEvent.deltaX, 10.2);
  shouldBe(testEvent.deltaY, 20.3);
  shouldBe(testEvent.deltaZ, 30.4);
  shouldBe(testEvent.deltaMode, WheelEvent.DOM_DELTA_PAGE);
}
