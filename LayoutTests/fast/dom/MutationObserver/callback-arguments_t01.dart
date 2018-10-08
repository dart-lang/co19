/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Verifies that MutationObserver is passed to the callback as
 * expected.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var mutationObserver;
  mutationCallback(mutations, observer) {
    shouldBe(observer, mutationObserver);
    asyncEnd();
  }
  mutationObserver = new MutationObserver(mutationCallback);
  var div = document.createElement('div');
  mutationObserver.observe(div, attributes: true);
  asyncStart();
  div.setAttribute('foo', 'bar');
}
