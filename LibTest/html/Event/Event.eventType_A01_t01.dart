/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Event.eventType(String type, String name, {bool canBubble: true,
 * bool cancelable: true})
 * Creates a new Event object of the specified type.
 * @description Checks that event of specified type is created.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var ev = new Event.eventType('MouseEvent', 'mousedown');

  Expect.isTrue(ev is MouseEvent);
  Expect.isTrue(ev.bubbles);
  Expect.isTrue(ev.cancelable);

  ev = new Event.eventType('KeyboardEvent', 'keyup',
      canBubble: false, cancelable: false);

  Expect.isTrue(ev is KeyboardEvent);
  Expect.isFalse(ev.bubbles);
  Expect.isFalse(ev.cancelable);
}
