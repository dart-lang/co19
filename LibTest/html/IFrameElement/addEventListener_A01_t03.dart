/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addEventListener(String type, EventListener listener,
 * [bool useCapture])
 * Register an event handler of a specific event type on the EventTarget.
 * @description Checks that event is delivered to all listeners
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'click';
  IFrameElement x = new IFrameElement();
  document.body.append(x);

  asyncMultiStart(3);

  x.addEventListener(type, (e) {
    Expect.equals(type, e.type);
    asyncEnd();
  });

  x.onClick.listen((e) {
    Expect.equals(type, e.type);
    asyncEnd();
  });

  x.on[type].listen((e) {
    Expect.equals(type, e.type);
    asyncEnd();
  });

  var event = new Event(type);
  x.dispatchEvent(event);
}
