/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void stopImmediatePropagation()
 * For this particular event, no other listener will be called.
 * Neither those attached on the same element, nor those attached on elements
 * which will be traversed later (in capture phase, for instance)
 * @description Checks that no other listener attached to the same element is
 * called.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'click';
  ButtonElement x = new ButtonElement();
  document.body.append(x);

  var n = 10;
  var numCalled = 0;

  asyncStart();

  EventListener genHandler() => (e) {
        Expect.equals(0, numCalled++);
        e.stopImmediatePropagation();
        asyncEnd();
      };

  for (var i = 0; i < n; ++i) x.addEventListener(type, genHandler());

  var event = new Event(type);
  x.dispatchEvent(event);
}
