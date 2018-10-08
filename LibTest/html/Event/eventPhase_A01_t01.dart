/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int eventPhase
 * Indicates which phase of the event flow is being processed.
 * @description Checks expected attribute values during different phases.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var body = document.body;
  var div = new DivElement();
  body.append(div);

  Element.clickEvent.forElement(body, useCapture: true).listen((e) {
    Expect.equals(Event.CAPTURING_PHASE, e.eventPhase);
    asyncEnd();
  });

  Element.clickEvent.forElement(body).listen((e) {
    Expect.equals(Event.BUBBLING_PHASE, e.eventPhase);
    asyncEnd();
  });

  Element.clickEvent.forElement(div).listen((e) {
    Expect.equals(Event.AT_TARGET, e.eventPhase);
    asyncEnd();
  });

  asyncMultiStart(3);
  div.dispatchEvent(new Event('click'));
}
