/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ElementEvents get on
 * @description Checks that on can be used to listen to custom events
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  var type = 'my_event';

  x.on[type].listen((e) {
    Expect.equals(type, e.type);
    asyncEnd();
  });

  var event = new Event(type);
  x.dispatchEvent(event);
}

main() {
  List<Node> targets = [
    new IFrameElement(),
    new DocumentFragment(),
  ];
  asyncMultiStart(targets.length);
  for (Node x in targets) {
    check(x);
  }
}
