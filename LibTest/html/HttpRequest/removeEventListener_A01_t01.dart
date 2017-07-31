/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeEventListener(String type, EventListener listener, [bool useCapture])
 * @description Checks that listener is removed.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const myType = "myType";

bool first = true;

main() {
  var request = new HttpRequest();

  void listener(Event event) {
    if (first) {
      first = false;
      request.removeEventListener(myType, listener);
    } else {
      Expect.fail("removed listener called");
    }
  }

  request.addEventListener(myType, (listener));
  request.dispatchEvent(new Event(myType));
  request.dispatchEvent(new Event(myType));
  request.dispatchEvent(new Event(myType));
}
