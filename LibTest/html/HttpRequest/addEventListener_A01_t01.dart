/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addEventListener(String type, EventListener listener, [bool useCapture])
 * Register an event handler of a specific event type on the EventTarget.
 * @description Checks that added listener works.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const myType = "myType";

main() {
  Event ev0 = new Event(myType);
  var request = new HttpRequest();
  asyncStart();
  request.addEventListener(myType, (Event event) {
    Expect.equals(ev0, event);
    asyncEnd();
  });
  request.dispatchEvent(ev0);
}
