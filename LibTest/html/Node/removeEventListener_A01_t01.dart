/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeEventListener(String type, EventListener listener,
 * [bool useCapture])
 * Removes an event listener from the EventTarget.
 * @description Checks that that correct listener is removed
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  var type = 'click';

  EventListener handler1 = (e) {
    Expect.equals(type, e.type);
    asyncEnd();
  };

  var seen = false;
  EventListener handler2;
  handler2 = (e) {
    if (seen) Expect.fail('should be run once');
    Expect.equals(type, e.type);
    x.removeEventListener(type, handler2); // remove itself when triggered
    seen = true;
    asyncEnd();
  };

  x.addEventListener(type, handler1);
  x.addEventListener(type, handler2);

  var event = new Event(type);
  x.dispatchEvent(event);
  event = new Event(type);
  x.dispatchEvent(event);
}

main() {
  List<Node> targets = [
    new Text("Text1"),
    new Comment("Comment"),
    new DocumentFragment(),
  ];
  asyncMultiStart(
      targets.length * 3); // first time two handlers, second time one handler
  for (Node x in targets) {
    check(x);
  }
}
