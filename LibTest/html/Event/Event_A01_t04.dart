/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Event(String type, {bool canBubble: true, bool cancelable: true})
 * @description Checks that if canBubble is false event is not cancelable
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var ev = new Event('whatever', cancelable: false);
  var body = document.body;

  body.on['whatever'].listen((e) {
    Expect.isFalse(e.cancelable);
  });

  body.dispatchEvent(ev);
}
