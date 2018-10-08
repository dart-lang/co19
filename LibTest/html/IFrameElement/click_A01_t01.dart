/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void click()
 * Simulates a click on the current element.
 * @description Checks that click event happens when click() is called.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var body = document.body;
  IFrameElement x = new IFrameElement();
  body.append(x);

  asyncStart();
  x.onClick.listen((e) {
    asyncEnd();
  });

  x.click();
}
