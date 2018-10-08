/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  crash(_) {
    setTimeout(() => asyncEnd(), 0);
  }

  asyncStart();
  setTimeout(() {
    document.addEventListener('DOMNodeInsertedIntoDocument', crash, true);
    document.addEventListener('DOMSubtreeModified', (_) { /* noop */ }, false);
    document.body = document.createElement('body');
  }, 0);

  document.body.append(new DivElement());
}
