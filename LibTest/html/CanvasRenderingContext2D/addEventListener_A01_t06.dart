/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addEventListener(String type, EventListener listener,
 * [bool useCapture])
 * Register an event handler of a specific event type on the EventTarget.
 * @description Checks that several listeners can be registered with useCapture
 */
import "dart:html";
import "../../../Utils/expect.dart";

var n = 10;

void check(Node x) {
  var type = 'click';
  document.body.append(x);

  asyncMultiStart(n);

  EventListener genHandler() => (e) {
        Expect.equals(type, e.type);
        Expect.equals(Event.CAPTURING_PHASE, e.eventPhase);
        asyncEnd();
      };

  for (var i = 0; i < n; ++i)
    document.body.addEventListener(type, genHandler(), true);

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
  asyncMultiStart(targets.length * n);
  for (Node x in targets) {
    check(x);
  }
}
