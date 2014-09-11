/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that the DOM_KEY_LOCATION_* constants are defined on
 * KeyboardEvent
 * href="http://www.w3.org/TR/DOM-Level-3-Events/#events-KeyboardEvent"
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  shouldBe(KeyboardEvent.DOM_KEY_LOCATION_STANDARD, 0x00);
  shouldBe(KeyboardEvent.DOM_KEY_LOCATION_LEFT, 0x01);
  shouldBe(KeyboardEvent.DOM_KEY_LOCATION_RIGHT, 0x02);
  shouldBe(KeyboardEvent.DOM_KEY_LOCATION_NUMPAD, 0x03);
}
