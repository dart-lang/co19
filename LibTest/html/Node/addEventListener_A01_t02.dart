/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addEventListener(String type, EventListener listener,
 * [bool useCapture])
 * Register an event handler of a specific event type on the EventTarget.
 * @description Checks that listener for custom event can be added
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  var type = 'my_event';
  x.addEventListener(type, (e) {
    Expect.equals(type, e.type);
    asyncEnd();
  });

  var event = new Event(type);
  x.dispatchEvent(event);
}

main() {
  List<Node> targets = [
    new Text("Text1"),
    new Comment("Comment"),
    new IFrameElement(),
    document,
    new DocumentFragment(),
  ];
  asyncMultiStart(targets.length);
  for (Node x in targets) {
    check(x);
  }
}
