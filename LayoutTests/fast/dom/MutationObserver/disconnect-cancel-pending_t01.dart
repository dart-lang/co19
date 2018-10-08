/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that WebKitMutationObserver.disconnect cancels pending 
 * delivery
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var mutations;
  var observer;
  var div;

  finish() {
    debug('...and re-observing should not see any of the previously-generated records.');
    shouldBe(mutations.length, 1);
    shouldBe(mutations[0].attributeName, "bar");
    asyncEnd();
  }

  next() {
    debug('Disconnecting should cancel any pending delivery...');
    shouldBeNull(mutations);
    observer.observe(div, attributes: true);
    div.setAttribute('bar', 'baz');
    setTimeout(finish, 0);
  }

  start() {
    mutations = null;
    div = document.createElement('div');

    observer = new MutationObserver((m,o) {
      mutations = m;
    });

    observer.observe(div, attributes: true);
    div.setAttribute('foo', 'bar');
    observer.disconnect();
    setTimeout(next, 0);
  }

  asyncStart();
  start();
}
