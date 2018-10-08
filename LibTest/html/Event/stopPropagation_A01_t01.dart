/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void stopPropagation()
 * Stops the propagation of events further along in the DOM.
 * @description Checks that stopPropagation() prevents an event from bubbling.
 * called.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'click';
  var body = document.body;
  var x = new ButtonElement();
  body.append(x);

  asyncStart();

  body.onClick.listen((e) {
    // will not be called becase of stopPropagation()
    Expect.fail('should not happen');
  });

  x.onClick.listen((e) {
    // will be called at target
    e.stopPropagation();
    asyncEnd();
  });

  x.dispatchEvent(new Event(type));
}
