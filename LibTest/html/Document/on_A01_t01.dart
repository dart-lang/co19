/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Events on
 * This is an ease-of-use accessor for event streams which should only be used
 * when an explicit accessor is not available.
 * @description Checks that the accessor works for standard events.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

const eventType = 'keydown';

main() {
  asyncStart();
  document.on[eventType].listen((Event e) {
    Expect.equals(eventType, e.type);
    asyncEnd();
  });
  document.dispatchEvent(new KeyboardEvent(eventType));
}
