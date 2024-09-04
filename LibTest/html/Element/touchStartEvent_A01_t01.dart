// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion const touchStartEvent
/// Static factory designed to expose touchstart events to event handlers
/// that are not necessarily instances of Element.
/// @description Checks that correct events are delivered via the stream

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'touchstart';
  var x = document.body;
  if (x != null) {
    var event;
    try {
      event = new TouchEvent(type);
    } catch (_) {
      // TouchEvent is not present in Safari and Firefox. Nothing to test.
      return;
    }
    asyncStart();
    Element.touchStartEvent.forElement(x).listen((e) {
      Expect.equals(type, e.type);
      asyncEnd();
    });
    x.dispatchEvent(event);
  } else {
    Expect.fail("Body is null");
  }
}
