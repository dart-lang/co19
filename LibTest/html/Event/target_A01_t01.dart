/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion EventTarget get target
 * A reference to the target to which the event was originally dispatched.
 * @description Checks expected target during different phases.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var body = document.body;
  var div = new DivElement();
  body.append(div);

  Element.clickEvent.forElement(body, useCapture: true).listen((e) {
    Expect.identical(div, e.target);
    asyncEnd();
  });

  Element.clickEvent.forElement(body).listen((e) {
    Expect.identical(div, e.target);
    asyncEnd();
  });

  Element.clickEvent.forElement(div).listen((e) {
    Expect.identical(div, e.target);
    asyncEnd();
  });

  asyncMultiStart(3);
  div.dispatchEvent(new Event('click'));
}
