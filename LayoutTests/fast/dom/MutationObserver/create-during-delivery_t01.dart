/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that MutationObservers created during delivery must wait 
 * for the next loop.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var order = [];

  finish() {
    shouldBe(order.length, 4);
    shouldBe(order[0], 1);
    shouldBe(order[1], 2);
    shouldBe(order[2], 1);
    shouldBe(order[3], 3);
    asyncEnd();
  }

  var div = document.createElement('div');

  var observer3;
  var observer1 = new MutationObserver((mutations, observer) {
    order.add(1);
    if (observer3 == null) {
      observer3 = new MutationObserver((mutations, observer) {
        order.add(3);
      });
      observer3.observe(div, attributes: true);
      div.setAttribute('foo', 'baz');
    }
  });
  var observer2 = new MutationObserver((mutations, observer) {
    order.add(2);
  });

  observer1.observe(div, attributes: true);
  observer2.observe(div, attributes: true);
  asyncStart();
  div.setAttribute('foo', 'bar');
  setTimeout(finish, 0);
}
