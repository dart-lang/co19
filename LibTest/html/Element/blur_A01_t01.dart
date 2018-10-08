/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void blur()
 * Removes keyboard focus from the current element.
 * @description Checks that blur event happens when blur() is called.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var body = document.body;
  var x = new ButtonElement();
  body.append(x);

  asyncStart();
  x.onBlur.listen((e) {
    asyncEnd();
  });

  x.focus();
  x.blur();
}
