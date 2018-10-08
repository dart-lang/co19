/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description MutationObserver wrappers should survive GC for passing into 
 * the callback even if JS has lost references.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var _observer;

  addObserver(node, MutationCallback fn) {
    var observer = new MutationObserver(fn);
    _observer = observer;
    observer.observe(node, attributes:true);
  }

  addObserver(document.body, (records, observer) {
    shouldBe(observer, _observer);
    asyncEnd();
  });

  document.body.setAttribute('touch', 'the node');
  asyncStart();
}

