/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool dispatchEvent(Event event)
 * Dispatch an event to this EventTarget.
 * @description Checks that an event is dispatched.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

const eventType = 'keydown';

void check(dynamic x) {
  x.onKeyDown.listen((KeyboardEvent e) {
    Expect.equals(eventType, e.type);
    asyncEnd();
  });
  x.dispatchEvent(new KeyboardEvent(eventType));
}

main() {
  List<Node> targets = [
    new IFrameElement(),
    document,
  ];
  asyncMultiStart(targets.length);
  for (Node x in targets) {
    check(x);
  }
}
