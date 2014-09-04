/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests various event attributes after dispatchEvent throws an exception.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

_shouldBe(aDescription, a, b)
{
  debug(aDescription);
  shouldBe(a, b);
}

main() {
  var event = new Event.eventType('MouseEvent', '');

  try {
    document.body.dispatchEvent(event);
  } catch (e) {
    // InvalidStateError: The event provided is uninitialized.
  } finally {
    _shouldBe("event.target", event.target, null);
    _shouldBe("event.currentTarget", event.currentTarget, null);
    _shouldBe("event.relatedTarget", event.relatedTarget, null);
    _shouldBe("event.eventPhase", event.eventPhase, 0);
  }
}
