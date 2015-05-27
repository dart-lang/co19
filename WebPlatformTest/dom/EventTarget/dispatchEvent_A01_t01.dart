/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/dom/events/EventTarget-dispatchEvent.html
 *
 * @description If the event's dispatch flag is set, an InvalidStateError must be thrown
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var ev = new Event("type", canBubble:false, cancelable:false);

  var target = document.createElement("div");
  target.addEventListener("type", (e) {
    Expect.throws(() {
      target.dispatchEvent(e);
    }, (e)=>e is DomException, "target");
    Expect.throws(() {
      document.dispatchEvent(e);
    }, (e)=>e is DomException, "document");
    asyncEnd();
  });

  asyncStart();
  Expect.isTrue(target.dispatchEvent(ev), "dispatchEvent must return true");
}
