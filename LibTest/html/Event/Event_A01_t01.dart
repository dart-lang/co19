/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Event(String type, {bool canBubble: true, bool cancelable: true})
 * @description Checks that event of standard type can be constructed
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var ev = new Event('click');

  asyncStart();
  document.body.onClick.listen((e) {
    asyncEnd();
  });

  document.body.dispatchEvent(ev);
}
