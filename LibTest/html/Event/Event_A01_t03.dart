/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Event(String type, {bool canBubble: true, bool cancelable: true})
 * @description Checks that if canBubble is false event will not bubble
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var ev = new Event('whatever', canBubble: false);
  var body = document.body;
  var div = new DivElement();
  body.append(div);

  body.on['whatever'].listen((e) {
    Expect.fail('should not happen');
  });

  div.dispatchEvent(ev);
}
