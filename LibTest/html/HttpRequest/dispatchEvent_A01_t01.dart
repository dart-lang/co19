/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool dispatchEvent(Event event)
 * Dispatch an event to this EventTarget.
 * @description Checks that an event is diapatched.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

const eventType = 'keydown';

main() {
  var request = new HttpRequest();
  asyncStart();
  request.addEventListener(eventType, (var e) {
    Expect.equals(eventType, e.type);
    asyncEnd();
  });
  request.dispatchEvent(new KeyboardEvent(eventType));
}
