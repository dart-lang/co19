/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion EventTarget get currentTarget
 * A reference to the currently registered target for the event.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var body = document.body;
  var div = new DivElement();
  body.append(div);

  body.onClick.listen((e) {
    Expect.identical(body, e.currentTarget);
    asyncEnd();
  });

  div.onClick.listen((e) {
    Expect.identical(div, e.currentTarget);
    asyncEnd();
  });

  asyncMultiStart(2);
  div.dispatchEvent(new Event('click'));
}
