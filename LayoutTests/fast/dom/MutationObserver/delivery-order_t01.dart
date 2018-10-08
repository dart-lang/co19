/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that MutationObservers are delivered to in order of 
 * creation.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var order = [];
  var observers = [];

  finish() {
    shouldBe(order.length, 10);
    shouldBe(order[0], 0);
    shouldBe(order[1], 1);
    shouldBe(order[2], 2);
    shouldBe(order[3], 3);
    shouldBe(order[4], 4);
    shouldBe(order[5], 5);
    shouldBe(order[6], 6);
    shouldBe(order[7], 7);
    shouldBe(order[8], 8);
    shouldBe(order[9], 9);
    asyncEnd();
  }

  setUpOrdering(num) {
    observers.add(new MutationObserver((mutations, observer) {
      order.add(num);
    }));
  }

  for (var i = 0; i < 10; ++i) {
    setUpOrdering(i);
  }

  asyncStart();
  var div = document.createElement('div');
  observers[3].observe(div, attributes: true);
  observers[2].observe(div, characterData: true, subtree: true);
  observers[1].observe(div, attributes: true);
  observers[7].observe(div, childList: true);
  observers[4].observe(div, attributes: true);
  observers[9].observe(div, attributes: true);
  observers[0].observe(div, childList: true);
  observers[5].observe(div, attributes: true);
  observers[6].observe(div, characterData: true, subtree: true);
  observers[8].observe(div, attributes: true);
  div.setAttribute('foo', 'bar');
  div.append(new Text('hello'));
  div.firstChild.text = 'goodbye';
  setTimeout(finish, 0);
}
