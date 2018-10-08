/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeEventListener(String type, EventListener listener,
 * [bool useCapture])
 * Removes an event listener from the EventTarget.
 * @description Checks that that correct listener is removed with useCapture
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'click';
  IFrameElement x = new IFrameElement();
  var body = document.body;
  body.append(x);

  EventListener handler1 = (e) {
    Expect.equals(type, e.type);
    asyncEnd();
  };

  var seen = false;
  EventListener handler2;
  handler2 = (e) {
    if (seen) Expect.fail('should be run once');
    Expect.equals(type, e.type);
    body.removeEventListener(
        type, handler2, true); // remove itself when triggered
    seen = true;
    asyncEnd();
  };

  body.addEventListener(type, handler1, true);
  body.addEventListener(type, handler2, true);

  asyncMultiStart(3); // first time two handlers, second time one handler
  var event = new Event(type);
  x.dispatchEvent(event);
  event = new Event(type);
  x.dispatchEvent(event);
}
