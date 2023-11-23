// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion const touchLeaveEvent
/// Static factory designed to expose touchleave events to event handlers
/// that are not necessarily instances of Element.
/// @description Checks that correct events are delivered via the stream

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'touchleave';
  var x = document.body;
  if (x != null) {
    asyncStart();
    Element.touchLeaveEvent.forElement(x).listen((e) {
      Expect.equals(type, e.type);
      asyncEnd();
    });

    var event = new TouchEvent(type);
    x.dispatchEvent(event);
  } else {
    Expect.fail("Body is null");
  }
}
