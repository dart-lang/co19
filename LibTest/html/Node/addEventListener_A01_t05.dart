/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addEventListener(String type, EventListener listener,
 * [bool useCapture])
 * Register an event handler of a specific event type on the EventTarget.
 * @description Checks that several listeners can be registered
 */
import "dart:html";
import "../../../Utils/expect.dart";

var n = 1;

void check(Node x) {
  var type = 'click';

  EventListener genHandler() => (e) {
        Expect.equals(type, e.type);
        asyncEnd();
      };

  for (var i = 0; i < n; ++i) x.addEventListener(type, genHandler());

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
