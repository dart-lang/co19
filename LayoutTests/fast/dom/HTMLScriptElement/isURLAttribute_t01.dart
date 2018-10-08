/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that accessing the src attribute of a script element
 * does not cause an assertion to fail.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var s0 = new ScriptElement();
  s0.src = "data:text/javascript,";
  s0.id = "target";
  document.head.append(s0);

  asyncStart();
  s0.onLoad.first.then((_) {
    (document.getElementById("target") as ScriptElement).src;
    asyncEnd();
  });
}
