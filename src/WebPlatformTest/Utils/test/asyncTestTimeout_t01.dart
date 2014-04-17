/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description test fails for time out
 */
import 'dart:html';
import "../expectWeb.dart";

main() {
test(() {
  var ev = new Event("type");
  var target = document.createElement("div");

  asyncStart();
  target.addEventListener("type", (e) {
    print("about to return");
    return;
    asyncEnd();
  });

  target.dispatchEvent(ev);
}, "async timeout");

checkTestFailures();
}
