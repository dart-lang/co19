/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Element get matchingTarget
 * A pointer to the element whose CSS selector matched within which an event
 * was fired.
 * If this Event was not associated with any Event delegation, accessing this
 * value will throw an UnsupportedError.
 * @description Checks that UnsupportedError is thrown if there is no event
 * delegation.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var body = document.body;
  var id1 = new DivElement()..id = 'id';
  body.append(id1);

  body.onClick.listen((e) {
    Expect.throws(() {
      e.matchingTarget;
    }, (e) => e is UnsupportedError);
    asyncEnd();
  });

  asyncStart();
  id1.click();
}
