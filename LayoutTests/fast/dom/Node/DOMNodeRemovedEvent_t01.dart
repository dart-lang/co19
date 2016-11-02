/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks that DOMNodeRemovedEvent is emitted once
 * (and only once).
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var div = document.createElement("div");
  document.body.append(div);

  var count = 0;
  document.body.addEventListener("DOMNodeRemoved", (_) { count++; }, false);

  div.remove();

  shouldBe(count, 1);
}
