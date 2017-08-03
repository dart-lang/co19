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

void listener(Event event) {
  if (first) {
    first = false;
    window.removeEventListener(myType, listener);
  } else {
    Expect.fail("removed listener called");
  }
}

main() {
  window.addEventListener(myType, (listener));
  window.dispatchEvent(new Event(myType));
  window.dispatchEvent(new Event(myType));
  window.dispatchEvent(new Event(myType));
}
