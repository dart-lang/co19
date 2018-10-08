/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Clearing transient observers after observation node is GCed 
 * should not cause a crash.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var mutations;

  callback(m,o) {
    mutations = m;
  }
  var observer = new MutationObserver(callback);

  var div = document.createElement('div');
  SpanElement span = div.append(document.createElement('span'));
  observer.observe(div, attributes: true, subtree: true);
  span.remove();
  div = null;
  span.setAttribute('foo', 'bar');
  asyncStart();
  setTimeout(() {
    shouldBe(mutations.length, 1);
    asyncEnd();
  }, 0);
}
