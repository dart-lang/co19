/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Event(String type, {bool canBubble: true, bool cancelable: true})
 * @description Checks that event of custom type can be constructed and that
 * canBubble and cancelable are true by default.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var ev = new Event('whatever');
  var body = document.body;
  var div = new DivElement();
  body.append(div);

  asyncStart();
  // wait for bubbling
  body.on['whatever'].listen((e) {
    Expect.isTrue(e.cancelable);
    asyncEnd();
  });

  div.dispatchEvent(ev); // initiate on inner div
}
