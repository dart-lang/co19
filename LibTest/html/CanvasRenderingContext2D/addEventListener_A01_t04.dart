/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addEventListener(String type, EventListener listener,
 * [bool useCapture])
 * Register an event handler of a specific event type on the EventTarget.
 * @description Checks that useCapture can be used to intercept events on
 * capturing stage.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'focus';
  IFrameElement x = new IFrameElement();
  document.body.append(x);

  asyncMultiStart(2);

  // intercept on capture
  document.body.addEventListener(type, (e) {
    Expect.equals(type, e.type);
    Expect.equals(Event.CAPTURING_PHASE, e.eventPhase);
    asyncEnd();
  }, true);

  // intercept on target
  x.onFocus.listen((e) {
    Expect.equals(type, e.type);
    Expect.equals(Event.AT_TARGET, e.eventPhase);
    asyncEnd();
  });

  // click on button
  var event = new Event(type, canBubble: false);
  x.dispatchEvent(event);
}
