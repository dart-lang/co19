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
 * @description Checks that no other listener attached to other elements
 * is called.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'click';
  var body = document.body;
  var x = new ButtonElement();
  body.append(x);

  asyncStart();

  body.addEventListener(type, (e) {
    // will be called first on capture
    e.stopImmediatePropagation();
    asyncEnd();
  }, /*useCapture*/ true);

  x.addEventListener(type, (e) {
    // will not be called because of stopImmediatePropagation()
    Expect.fail('should not happen');
  }, /*useCapture*/ true);

  x.dispatchEvent(new Event(type));
}
