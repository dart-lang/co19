/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that mutations during delivery do not interrupt delivery
 * order.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var order = [];

  finish() {
    shouldBe(order.length, 3);
    shouldBe(order[0], 1);
    shouldBe(order[1], 3);
    shouldBe(order[2], 2);
    asyncEnd();
  }

  var div = document.createElement('div');

  var observer1 = new MutationObserver((mutations, observer) {
    order.add(1);
    div.append(document.createElement('span'));
  });
  var observer2 = new MutationObserver((mutations, observer) {
    order.add(2);
  });
  var observer3 = new MutationObserver((mutations, observer) {
    order.add(3);
  });

  observer1.observe(div, attributes: true);
  observer2.observe(div, childList: true);
  observer3.observe(div, attributes: true);
  div.setAttribute('foo', 'bar');

  asyncStart();
  setTimeout(finish, 0);
}
