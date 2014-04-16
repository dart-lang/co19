/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description MutationObserver wrappers should survive GC for passing into 
 * the callback even if JS has lost references and the only remaining 
 * observations are transient.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  var _observer;

  addObserver(node, fn) {
    var observer = new MutationObserver(fn);
    _observer = observer;
    observer.observe(node, attributes:true, subtree: true);
  }

  var root = document.createElement('div');
  var child = root.append(document.createElement('span'));
  addObserver(root, (records, observer) {
    shouldBe(observer, _observer);
    asyncEnd();
  });

  child.remove();
  child.setAttribute('foo', 'bar');
  root = null;

  asyncStart();
}

